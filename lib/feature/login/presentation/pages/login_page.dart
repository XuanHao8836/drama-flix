import 'package:drama_flix/app/core/constants/constants.dart';
import 'package:drama_flix/app/core/widgets/webview_page.dart';
import 'package:drama_flix/common/utils/snackbar_helper.dart';
import 'package:drama_flix/feature/login/domain/model/sign_in_type.dart';
import 'package:drama_flix/feature/login/presentation/bloc/auth_cubit.dart';
import 'package:drama_flix/feature/login/presentation/bloc/auth_state.dart';
import 'package:drama_flix/feature/login/presentation/widget/social_login_button.dart';
import 'package:drama_flix/feature/main/presentation/pages/main_page.dart';
import 'package:drama_flix/generated/assets.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: null, body: _LoginPageWidget());
  }
}

class _LoginPageWidget extends StatelessWidget {
  const _LoginPageWidget();

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.error != null) {
            showSnackBar(
              context,
              appLocalizations.loginError(state.error.toString()),
              backgroundColor: Colors.red,
            );
          }
          else if (state.user != null && !state.isLoading && state.error == null) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const MainPage()),
                  (route) => false,
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(Assets.backgroundLogin, fit: BoxFit.cover),
              ),
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.transparent],
                      stops: [0.0, 1],
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 100.0),
                    Center(
                      child: Image.asset(
                        Assets.iconLogo,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      appLocalizations.welcomeToAppname(Constants.appName),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      appLocalizations.movieLoversNetwork,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFEEEEEE),
                      ),
                    ),
                    const Spacer(flex: 4),
                    Text(
                      appLocalizations.signIn,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SocialLoginButton(
                      iconAsset: Assets.iconsIcLogoFacebook,
                      text:
                      appLocalizations.signInWithFacebook,
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        _signIn(context, SignInType.facebook);
                      },
                    ),
                    const SizedBox(height: 8),
                    SocialLoginButton(
                      iconAsset: Assets.iconsIcLogoGoogle,
                      text:
                      appLocalizations.signInWithGoogle,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      onPressed: () {
                        _signIn(context, SignInType.google);
                      },
                    ),
                    const SizedBox(height: 8),
                    if (defaultTargetPlatform == TargetPlatform.iOS)
                      SocialLoginButton(
                        iconAsset: Assets.iconsIcLogoApple,
                        text:
                        appLocalizations.signInWithApple,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        onPressed: () {
                          _signIn(context, SignInType.apple);
                        },
                      ),
                    const Spacer(),
                    Text(
                      appLocalizations.byRegistrationYouAgreeTo,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: [
                          clickableTextSpan(
                            text: appLocalizations.termsOfUse ,
                            url: Constants.termOfUse,
                            context: context,
                          ),
                          TextSpan(
                            text: appLocalizations.and,
                            style: const TextStyle(fontWeight: FontWeight.normal)
                          ),
                          clickableTextSpan(
                            text:
                            appLocalizations.privacyPolicy,
                            url: Constants.privacyPolice,
                            context: context,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              if (state.isLoading)
                Container(
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                  child: Center(
                    child: Opacity(
                      opacity: 0.5,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }

  void _signIn(BuildContext context, SignInType signInType) async {
    final cubit = context.read<AuthCubit>();
    cubit.signIn(signInType);
  }
}

TextSpan clickableTextSpan({
  required String text,
  required String url,
  required BuildContext context,
}) {
  return TextSpan(
    text: text,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      color: Colors.white,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WebViewPage(url: url)),
        );
      },
  );
}