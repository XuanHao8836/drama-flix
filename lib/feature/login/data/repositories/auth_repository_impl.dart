import 'dart:convert';

import 'package:drama_flix/feature/login/data/mappers/user_mapper.dart';
import 'package:drama_flix/feature/login/data/source/remote/firebase_auth_data_source.dart';
import 'package:drama_flix/feature/login/domain/model/sign_in_type.dart';
import 'package:drama_flix/feature/login/domain/model/user.dart';
import 'package:drama_flix/feature/login/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  User? signedUser() {
    final firebaseUser = authDataSource.currentUser;
    return firebaseUser?.toUser();
  }

  @override
  Future<User> signIn(SignInType signInType) async {
    switch (signInType) {
      case SignInType.google:
         await GoogleSignIn.instance.initialize();
        final  GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();
         final GoogleSignInAuthentication googleAuth = googleUser.authentication;
         final credential = firebase_auth.GoogleAuthProvider.credential(
          idToken: googleAuth.idToken);
        final userCredential = await firebase_auth.FirebaseAuth.instance
            .signInWithCredential(credential);
        final user = userCredential.user?.toUser();
        if (user == null) {
          throw Exception('Đăng nhập Google đã sảy ra lỗi');
        }
        return user;

      case SignInType.facebook:
        final LoginResult loginResult = await FacebookAuth.instance.login(
          permissions: ['public_profile', 'email'],
        );
        if (loginResult.status == LoginStatus.success) {
          final accessToken = loginResult.accessToken!.tokenString;
          final firebase_auth.OAuthCredential facebookAuthCredential =
              firebase_auth.FacebookAuthProvider.credential(accessToken);
          final userCredential = await firebase_auth.FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);
          final response = await http.get(
            Uri.parse(
              'https://graph.facebook.com/v19.0/me?fields=id,name,picture.width(500).height(500)&access_token=$accessToken',
            ),
          );
          final profile = json.decode(response.body);
          final avatarUrl = profile['picture']['data']['url'];

          await userCredential.user?.updatePhotoURL(avatarUrl);

          final user = userCredential.user?.toUser();
          if (user == null) {
            throw Exception('Đăng nhập Facebook đã sảy ra lỗi');
          }
          return user;
        } else if (loginResult.status == LoginStatus.cancelled) {
          debugPrint('Đăng nhập Facebook đã bị hủy.');
          throw Exception('Đăng nhập Facebook đã bị hủy.');
        } else {
          debugPrint(
            'Đăng nhập Facebook thất bại với trạng thái: ${loginResult.status}',
          );
          throw Exception(
            'Đăng nhập Facebook thất bại với trạng thái: ${loginResult.status}',
          );
        }

      case SignInType.apple:
        throw Exception('Sign-in type does not supported');
    }
  }

  @override
  Future<void> signOut() async {
    firebase_auth.FirebaseAuth.instance.signOut();
  }

  @override
  Future<User?> updateUser({
    required String name,
    required String email,
  }) async {
    final firebaseUser = authDataSource.currentUser;
    if (firebaseUser != null) {
      if (firebaseUser.displayName != name) {
        await firebaseUser.updateDisplayName(name);
      }
      if (firebaseUser.email != email) {
        await firebaseUser.verifyBeforeUpdateEmail(email);
      }
      await firebaseUser.reload();
      final updatedUser = firebase_auth.FirebaseAuth.instance.currentUser;
      return updatedUser?.toUser();
    }
    throw Exception('Người dùng không tồn tại.');
  }

  @override
  Future updateAvatar(String path) async {
    final firebaseUser = authDataSource.currentUser;
    if (firebaseUser != null) {
      if (firebaseUser.photoURL != path) {
        await firebaseUser.updatePhotoURL(path);
      }
      await firebaseUser.reload();
      final updatedUser = firebase_auth.FirebaseAuth.instance.currentUser;
      return updatedUser?.toUser();
    }
    throw Exception('Người dùng không tồn tại.');
  }
}
