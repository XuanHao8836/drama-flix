import 'package:drama_flix/app/core/constants/constants.dart';
import 'package:drama_flix/generated/assets.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget{
  const ExplorePage({super.key});


  @override
  Widget build(BuildContext context) {
    final appLocations = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.iconLogo, width: 150, height: 150),
              Text(
                Constants.appName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                appLocations.watchDramaSeriesOnline,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.pinkAccent,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                appLocations.onboardingWelcomeHeadline,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                appLocations.onboardingWelcomeSubheadline,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}