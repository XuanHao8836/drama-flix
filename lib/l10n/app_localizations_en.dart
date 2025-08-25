// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello, World!';

  @override
  String get bottomNavHome => 'Home';

  @override
  String get bottomNavTheater => 'Theater';

  @override
  String get bottomNavHistory => 'History';

  @override
  String get bottomNavProfile => 'Profile';

  @override
  String get appbarAction => 'Done';

  @override
  String get appbarTitleProfile => 'Guest';

  @override
  String get becomeVip => 'Become VIP';

  @override
  String get enjoyAllThePerks => 'Enjoy all the perks';

  @override
  String get register => 'Register';

  @override
  String get settings => 'Settings';

  @override
  String get english => 'English';

  @override
  String get displayLanguage => 'Display language';

  @override
  String get myFavorite => 'My Favorite';

  @override
  String get watchHistory => 'Watch History';

  @override
  String get language => 'Language';

  @override
  String get nodatafound => 'No data found';

  @override
  String get thisActionMayContainAds => 'This action may contain Ads';

  @override
  String get anErrorHasOccurred => 'An error has occurred';

  @override
  String loginError(Object message) {
    return 'Login failed: $message';
  }

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get byRegistrationYouAgreeTo => 'By registration you agree to';

  @override
  String get signInWithApple => 'Sign in with Apple';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get signInWithFacebook => 'Sign in with Facebook';

  @override
  String get signIn => 'SIGN IN';

  @override
  String get movieLoversNetwork => 'Movie lovers network';

  @override
  String welcomeToAppname(Object appName) {
    return 'WELCOME TO $appName';
  }

  @override
  String get and => ' and ';

  @override
  String get retry => 'Retry';

  @override
  String get networkErrorTitle => 'Network Connection Error!';

  @override
  String get networkErrorContent => 'Please check your internet connection.';

  @override
  String get otherErrorTitle => 'An error occurred!';

  @override
  String get otherErrorContent =>
      'An unexpected error occurred. Please try again.';

  @override
  String get onboardingWelcomeHeadline =>
      'Welcome to the colorful world of cinema';

  @override
  String get onboardingWelcomeSubheadline =>
      'Discover thousands of movies and series with a completely new experience';

  @override
  String get watchDramaSeriesOnline => 'WATCH DRAMA SERIES ONLINE';

  @override
  String get onboarding => 'An unexpected error occurred. Please try again.';

  @override
  String get onboardingWelcomeDescription =>
      'Discover the colorful world of cinema right on your device.';

  @override
  String get onboardingExploreTitle => 'Explore rich content';

  @override
  String get onboardingExploreDescription =>
      'Thousands of movies and series are waiting for you to discover every day.';

  @override
  String get onboardingFindTitle => 'Easy searching';

  @override
  String get onboardingFindDescription =>
      'Smart search tools help you find your favorite movies in an instant.';

  @override
  String get onboardingTrendingTitle => 'Hot and Trending Movies';

  @override
  String get onboardingTrendingDescription =>
      'Always stay updated with the most-watched and hottest movies today.';

  @override
  String get onboardingSubscribeTitle => 'Subscribe for unlimited viewing';

  @override
  String get onboardingSubscribeDescription =>
      'Unlock the entire movie library and enjoy an ad-free experience.';

  @override
  String get onboardingSkipButton => 'Skip';

  @override
  String get onboardingNextButton => 'Continue';

  @override
  String get onboardingStartButton => 'Get Started';

  @override
  String get location_permission_title => 'Location Permission';

  @override
  String get location_permission_message =>
      'To use all features, the app needs access to your location. Do you want to grant permission?';

  @override
  String get location_permission_cancel => 'Cancel';

  @override
  String get location_permission_ok => 'Allow';

  @override
  String get location_permission_denied_forever_title =>
      'Location Permission Permanently Denied';

  @override
  String get location_permission_denied_forever_message =>
      'You need to enable location permission in Settings to continue using the app.';

  @override
  String get location_permission_denied_forever_close => 'Close';

  @override
  String get location_permission_denied_forever_open_settings =>
      'Open Settings';

  @override
  String get location_initial => 'Location not retrieved';

  @override
  String get location_loading => 'Retrieving location...';

  @override
  String location_failure(Object error) {
    return 'Error: $error';
  }

  @override
  String get location_denied => 'Permission denied';

  @override
  String get location_denied_forever => 'Permission permanently denied';

  @override
  String get searchHint => 'The secret of love';

  @override
  String get hotTrendingMovies => 'Hot Trending Movies';

  @override
  String get newReleasedMovies => 'New Released Movies';

  @override
  String get mostSearchedMovies => 'Most Searched Movies';
}
