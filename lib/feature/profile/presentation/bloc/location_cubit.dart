import 'package:drama_flix/feature/profile/presentation/bloc/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState.initial());

  Future<void> checkPermissionLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      switch (permission) {
        case LocationPermission.denied:
        case LocationPermission.unableToDetermine:
          emit(const LocationState.denied());
          break;

        case LocationPermission.deniedForever:
          emit(const LocationState.deniedForever());
          break;

        case LocationPermission.whileInUse:
        case LocationPermission.always:
          getLocation();
          break;

      }
    } catch (e) {
      emit(LocationState.failure(e.toString()));
    }
  }

  Future<void> requestPermissionLocation() async {
    try {
      await Geolocator.requestPermission();
      checkPermissionLocation();
    } catch (e) {
      emit(LocationState.failure(e.toString()));
    }
  }

  Future<void> getLocation() async {
    emit(const LocationState.loading());

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 0,
          timeLimit: Duration(seconds: 10),
        ),
      );

      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final placemark = placemarks.first;
      final country = placemark.country ?? "Không xác định";

      emit(LocationState.success(country));
    } catch (e) {
      emit(LocationState.failure(e.toString()));
    }
  }
}
