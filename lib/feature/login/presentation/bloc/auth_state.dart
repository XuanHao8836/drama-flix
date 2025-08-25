import 'package:drama_flix/feature/login/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required User? user,
    @Default(false) bool isLoading,
    String? error,
  }) = _AuthState;
}
