import 'package:drama_flix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  static const String _localeKey = 'languageCode';
  Locale _locale;

  LocaleProvider(this._locale);

  Locale get locale => _locale;

  static Future<LocaleProvider> create() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedLocaleCode = prefs.getString(_localeKey);
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
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, newLocale.languageCode);
    notifyListeners();
  }
}
