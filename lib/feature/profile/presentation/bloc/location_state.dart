
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_state.freezed.dart';

@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState.initial() = LocationInitial;
  const factory LocationState.loading() = LocationLoading;
  const factory LocationState.success(String locationText) = LocationSuccess;
  const factory LocationState.denied() = LocationDenied;
  const factory LocationState.deniedForever() = LocationDeniedForever;
  const factory LocationState.failure(String message) = LocationFailure;
}