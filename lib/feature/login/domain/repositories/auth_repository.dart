import 'package:drama_flix/feature/login/domain/model/sign_in_type.dart';
import 'package:drama_flix/feature/login/domain/model/user.dart';

abstract class AuthRepository {
  User? signedUser();

  Future<User> signIn(SignInType signInType);

  Future<void> signOut();

  Future updateUser({required String name, required String email});

  Future updateAvatar(String path);
}
