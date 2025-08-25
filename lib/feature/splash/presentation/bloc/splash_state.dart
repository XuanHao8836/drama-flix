import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loading() = _Loading;
  const factory SplashState.ready(bool hasSeenOnboarding) = _Ready;
  const factory SplashState.networkError() = _NetworkError;
  const factory SplashState.otherError() = _OtherError;
}