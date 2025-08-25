import 'package:drama_flix/common/utils/prefs_helper.dart';
import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  static const String _localeKey = 'languageCode';
  Locale _locale;

  LocaleProvider(this._locale);

  Locale get locale => _locale;

  static Future<LocaleProvider> create() async {
    final String? savedLocaleCode = PrefsHelper.getLocaleCode(_localeKey);
    final supportedLanguageCodes = AppLocalizations.supportedLocales
        .map((l) => l.languageCode)
        .toList();

    Locale initialLocale;
    if (savedLocaleCode != null &&
        supportedLanguageCodes.contains(savedLocaleCode)) {
      initialLocale = Locale(savedLocaleCode);
    } else {
      initialLocale = const Locale('en');
    }
    return LocaleProvider(initialLocale);
  }

  void setLocale(Locale newLocale) async {
    if (_locale == newLocale) return;
    _locale = newLocale;
    PrefsHelper.setLocaleCode(_localeKey, newLocale.languageCode);
    notifyListeners();
  }
}
