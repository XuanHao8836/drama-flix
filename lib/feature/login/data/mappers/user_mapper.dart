
import 'package:drama_flix/feature/login/domain/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
extension UserMapper on firebase_auth.User {
  User toUser() {
    return User(
      uid: uid,
      email: email ?? '',
      name: displayName ?? '',
      avatar: photoURL,
      phoneNumber: phoneNumber,
    );
  }
}