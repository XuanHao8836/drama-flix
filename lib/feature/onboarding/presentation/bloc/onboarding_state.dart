import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_state.freezed.dart';
@freezed
sealed class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial({
    required int currentPage,
  }) = _Initial;
}