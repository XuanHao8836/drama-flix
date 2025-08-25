import 'package:drama_flix/feature/login/domain/model/sign_in_type.dart';
import 'package:drama_flix/feature/login/domain/model/user.dart';
import 'package:drama_flix/feature/login/domain/repositories/auth_repository.dart';
import 'package:drama_flix/feature/login/presentation/bloc/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(const AuthState(user: null)) {
    checkUserSignedIn();
  }

  void checkUserSignedIn() {
    emit(
      state.copyWith(
        user: authRepository.signedUser(),
        isLoading: false,
        error: null,
      ),
    );
  }

  void signIn(SignInType signInType) async {
    try {
      if (!state.isLoading && state.user != null) {
        return;
      }
      emit(state.copyWith(user: null, isLoading: true, error: null));
      final user = await authRepository.signIn(signInType);
      emit(state.copyWith(user: user, isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(user: null, isLoading: false, error: e.toString()));
    }
  }

  Future<bool> signOut() async {
    try {
      await authRepository.signOut();
      emit(state.copyWith(user: null, isLoading: false, error: null));
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
  }) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));
      final updatedUser = await authRepository.updateUser(
        name: name,
        email: email,
      );
      emit(state.copyWith(user: updatedUser, isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> updateAvatar(String path) async {
    try {
      emit(state.copyWith(isLoading: true, error: null));
      final updatedUser = await authRepository.updateAvatar(path);
      emit(state.copyWith(user: updatedUser, isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  User? getAccount() {
    return authRepository.signedUser();
  }
}
