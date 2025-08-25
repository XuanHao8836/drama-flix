import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello, World!'**
  String get helloWorld;

  /// No description provided for @bottomNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNavHome;

  /// No description provided for @bottomNavTheater.
  ///
  /// In en, this message translates to:
  /// **'Theater'**
  String get bottomNavTheater;

  /// No description provided for @bottomNavHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get bottomNavHistory;

  /// No description provided for @bottomNavProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get bottomNavProfile;

  /// No description provided for @appbarAction.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get appbarAction;

  /// No description provided for @appbarTitleProfile.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get appbarTitleProfile;

  /// No description provided for @becomeVip.
  ///
  /// In en, this message translates to:
  /// **'Become VIP'**
  String get becomeVip;

  /// No description provided for @enjoyAllThePerks.
  ///
  /// In en, this message translates to:
  /// **'Enjoy all the perks'**
  String get enjoyAllThePerks;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @displayLanguage.
  ///
  /// In en, this message translates to:
  /// **'Display language'**
  String get displayLanguage;

  /// No description provided for @myFavorite.
  ///
  /// In en, this message translates to:
  /// **'My Favorite'**
  String get myFavorite;

  /// No description provided for @watchHistory.
  ///
  /// In en, this message translates to:
  /// **'Watch History'**
  String get watchHistory;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @nodatafound.
  ///
  /// In en, this message translates to:
  /// **'No data found'**
  String get nodatafound;

  /// No description provided for @thisActionMayContainAds.
  ///
  /// In en, this message translates to:
  /// **'This action may contain Ads'**
  String get thisActionMayContainAds;

  /// No description provided for @anErrorHasOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred'**
  String get anErrorHasOccurred;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'Login failed: {message}'**
  String loginError(Object message);

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @byRegistrationYouAgreeTo.
  ///
  /// In en, this message translates to:
  /// **'By registration you agree to'**
  String get byRegistrationYouAgreeTo;

  /// No description provided for @signInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get signInWithApple;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @signInWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Facebook'**
  String get signInWithFacebook;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get signIn;

  /// No description provided for @movieLoversNetwork.
  ///
  /// In en, this message translates to:
  /// **'Movie lovers network'**
  String get movieLoversNetwork;

  /// No description provided for @welcomeToAppname.
  ///
  /// In en, this message translates to:
  /// **'WELCOME TO {appName}'**
  String welcomeToAppname(Object appName);

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @networkErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Network Connection Error!'**
  String get networkErrorTitle;

  /// No description provided for @networkErrorContent.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection.'**
  String get networkErrorContent;

  /// No description provided for @otherErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'An error occurred!'**
  String get otherErrorTitle;

  /// No description provided for @otherErrorContent.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get otherErrorContent;

  /// No description provided for @onboardingWelcomeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the colorful world of cinema'**
  String get onboardingWelcomeHeadline;

  /// No description provided for @onboardingWelcomeSubheadline.
  ///
  /// In en, this message translates to:
  /// **'Discover thousands of movies and series with a completely new experience'**
  String get onboardingWelcomeSubheadline;

  /// No description provided for @watchDramaSeriesOnline.
  ///
  /// In en, this message translates to:
  /// **'WATCH DRAMA SERIES ONLINE'**
  String get watchDramaSeriesOnline;

  /// No description provided for @onboarding.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get onboarding;

  /// No description provided for @onboardingWelcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover the colorful world of cinema right on your device.'**
  String get onboardingWelcomeDescription;

  /// No description provided for @onboardingExploreTitle.
  ///
  /// In en, this message translates to:
  /// **'Explore rich content'**
  String get onboardingExploreTitle;

  /// No description provided for @onboardingExploreDescription.
  ///
  /// In en, this message translates to:
  /// **'Thousands of movies and series are waiting for you to discover every day.'**
  String get onboardingExploreDescription;

  /// No description provided for @onboardingFindTitle.
  ///
  /// In en, this message translates to:
  /// **'Easy searching'**
  String get onboardingFindTitle;

  /// No description provided for @onboardingFindDescription.
  ///
  /// In en, this message translates to:
  /// **'Smart search tools help you find your favorite movies in an instant.'**
  String get onboardingFindDescription;

  /// No description provided for @onboardingTrendingTitle.
  ///
  /// In en, this message translates to:
  /// **'Hot and Trending Movies'**
  String get onboardingTrendingTitle;

  /// No description provided for @onboardingTrendingDescription.
  ///
  /// In en, this message translates to:
  /// **'Always stay updated with the most-watched and hottest movies today.'**
  String get onboardingTrendingDescription;

  /// No description provided for @onboardingSubscribeTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscribe for unlimited viewing'**
  String get onboardingSubscribeTitle;

  /// No description provided for @onboardingSubscribeDescription.
  ///
  /// In en, this message translates to:
  /// **'Unlock the entire movie library and enjoy an ad-free experience.'**
  String get onboardingSubscribeDescription;

  /// No description provided for @onboardingSkipButton.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkipButton;

  /// No description provided for @onboardingNextButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingNextButton;

  /// No description provided for @onboardingStartButton.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingStartButton;

  /// No description provided for @location_permission_title.
  ///
  /// In en, this message translates to:
  /// **'Location Permission'**
  String get location_permission_title;

  /// No description provided for @location_permission_message.
  ///
  /// In en, this message translates to:
  /// **'To use all features, the app needs access to your location. Do you want to grant permission?'**
  String get location_permission_message;

  /// No description provided for @location_permission_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get location_permission_cancel;

  /// No description provided for @location_permission_ok.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get location_permission_ok;

  /// No description provided for @location_permission_denied_forever_title.
  ///
  /// In en, this message translates to:
  /// **'Location Permission Permanently Denied'**
  String get location_permission_denied_forever_title;

  /// No description provided for @location_permission_denied_forever_message.
  ///
  /// In en, this message translates to:
  /// **'You need to enable location permission in Settings to continue using the app.'**
  String get location_permission_denied_forever_message;

  /// No description provided for @location_permission_denied_forever_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get location_permission_denied_forever_close;

  /// No description provided for @location_permission_denied_forever_open_settings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get location_permission_denied_forever_open_settings;

  /// No description provided for @location_initial.
  ///
  /// In en, this message translates to:
  /// **'Location not retrieved'**
  String get location_initial;

  /// No description provided for @location_loading.
  ///
  /// In en, this message translates to:
  /// **'Retrieving location...'**
  String get location_loading;

  /// No description provided for @location_failure.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String location_failure(Object error);

  /// No description provided for @location_denied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied'**
  String get location_denied;

  /// No description provided for @location_denied_forever.
  ///
  /// In en, this message translates to:
  /// **'Permission permanently denied'**
  String get location_denied_forever;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'The secret of love'**
  String get searchHint;

  /// No description provided for @hotTrendingMovies.
  ///
  /// In en, this message translates to:
  /// **'Hot Trending Movies'**
  String get hotTrendingMovies;

  /// No description provided for @newReleasedMovies.
  ///
  /// In en, this message translates to:
  /// **'New Released Movies'**
  String get newReleasedMovies;

  /// No description provided for @mostSearchedMovies.
  ///
  /// In en, this message translates to:
  /// **'Most Searched Movies'**
  String get mostSearchedMovies;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
