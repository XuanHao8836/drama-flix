import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drama_flix/feature/splash/data/repositories/connectivity_repository_impl.dart';
import 'package:drama_flix/feature/splash/domain/repositories/connectivity_repository.dart';
import 'package:drama_flix/feature/splash/presentation/bloc/splash_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> injectSplashDI(GetIt getIt) async {
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerFactory<ConnectivityRepository>(
    () => ConnectivityRepositoryImpl(getIt()),
  );
  getIt.registerFactory(() => SplashCubit(getIt()));
}
