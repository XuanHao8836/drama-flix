import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDataSource {
  User? get currentUser => FirebaseAuth.instance.currentUser;
}