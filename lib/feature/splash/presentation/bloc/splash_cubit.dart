import 'dart:async';

import 'package:drama_flix/common/utils/prefs_helper.dart';
import 'package:drama_flix/feature/splash/domain/repositories/connectivity_repository.dart';
import 'package:drama_flix/feature/splash/presentation/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  final ConnectivityRepository _connectivityRepository;

  SplashCubit(this._connectivityRepository)
    : super(const SplashState.initial()) {
    initializeApp();
  }

  Future<void> initializeApp() async {
    emit(const SplashState.loading());
    try {
      final isConnected = await _connectivityRepository.isConnected().timeout(
        const Duration(seconds: 5),
        onTimeout: () => false,
      );

      if (!isConnected) {
        emit(const SplashState.networkError());
        return;
      }
      await Future.delayed(const Duration(seconds: 2));
      final hasSeenOnboarding = PrefsHelper.getHasSeenOnboarding();
      emit(SplashState.ready(hasSeenOnboarding));
    } on TimeoutException {
      emit(const SplashState.networkError());
    } catch (e) {
      emit(const SplashState.otherError());
    }
  }
}
