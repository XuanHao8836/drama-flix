import 'package:drama_flix/feature/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState.initial(currentPage: 0));

  void updatePage(int page) {
    emit(OnboardingState.initial(currentPage: page));
  }
}
