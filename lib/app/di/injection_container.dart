import 'package:drama_flix/feature/login/di.dart';
import 'package:drama_flix/feature/splash/di.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  injectAuthDI(sl);
  injectSplashDI(sl);
}
