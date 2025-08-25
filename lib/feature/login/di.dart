import 'package:drama_flix/feature/login/data/repositories/auth_repository_impl.dart';
import 'package:drama_flix/feature/login/data/source/remote/firebase_auth_data_source.dart';
import 'package:drama_flix/feature/login/domain/repositories/auth_repository.dart';
import 'package:drama_flix/feature/login/presentation/bloc/auth_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> injectAuthDI(GetIt getIt) async {
  /// Data-sources
  getIt.registerSingleton(FirebaseAuthDataSource());
  getIt.registerFactory(() => AuthCubit(getIt()));

  /// Repositories
  getIt.registerFactory<AuthRepository>(
    () =>
        AuthRepositoryImpl(authDataSource: getIt.get<FirebaseAuthDataSource>()),
  );
}
