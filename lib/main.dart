import 'package:drama_flix/app/di/injection_container.dart' as di;
import 'package:drama_flix/app/provider/locale_provider.dart';
import 'package:drama_flix/common/utils/prefs_helper.dart';
import 'package:drama_flix/feature/bottom_nav/presentation/bloc/bottom_nav_cubit.dart';
import 'package:drama_flix/feature/home/presentation/bloc/home_cubit.dart';
import 'package:drama_flix/feature/login/presentation/bloc/auth_cubit.dart';
import 'package:drama_flix/feature/splash/presentation/bloc/splash_cubit.dart';
import 'package:drama_flix/feature/splash/presentation/pages/splash_page.dart';
import 'package:drama_flix/firebase_options.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  await PrefsHelper.initialize();
  final localeProvider = await LocaleProvider.create();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: localeProvider),
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context) => di.sl<AuthCubit>()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => di.sl<SplashCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder:
          (BuildContext context, LocaleProvider localeProvider, Widget? child) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
              ),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                locale: localeProvider.locale,
                home: const SplashPage(),
              ),
            );
          },
    );
  }
}
