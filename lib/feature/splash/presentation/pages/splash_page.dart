import 'package:drama_flix/app/core/extensions/navigator_extension.dart';
import 'package:drama_flix/feature/login/presentation/bloc/auth_cubit.dart';
import 'package:drama_flix/feature/login/presentation/pages/login_page.dart';
import 'package:drama_flix/feature/main/presentation/pages/main_page.dart';
import 'package:drama_flix/feature/onboarding/presentation/pages/onboarding_main_page.dart';
import 'package:drama_flix/feature/splash/presentation/bloc/splash_cubit.dart';
import 'package:drama_flix/feature/splash/presentation/bloc/splash_state.dart';
import 'package:drama_flix/generated/assets.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _SplashPageState();
  }
}

class _SplashPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, splashState) {
        splashState.when(
          initial: () => {},
          loading: () => {},
          ready: (hasSeenOnboarding) async {
            if (!hasSeenOnboarding) {
              context.pushAndRemoveAll(const OnboardingMainPage());
            } else {
              if (!context.mounted) return;
              final authCubit = context.read<AuthCubit>();
              final page = authCubit.state.user != null
                  ? const MainPage()
                  : const LoginPage();
              context.pushAndRemoveAll(page);
            }
          },
          networkError: () => showNetworkError(context),
          otherError: () => showNetworkError(context),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Center(
              child: Image.asset(Assets.iconLogo, width: 150, height: 150),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context).thisActionMayContainAds,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showNetworkError(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Lỗi kết nối mạng!')));
  }
}
