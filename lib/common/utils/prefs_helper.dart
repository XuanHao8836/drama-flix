import 'package:drama_flix/app/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static late final SharedPreferences _prefs;
  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }
  static Future<bool> setHasSeenOnboarding(bool value) async {
    return _prefs.setBool(PrefsConstants.hasSeenOnboarding, value);
  }
  static bool getHasSeenOnboarding() {
    return _prefs.getBool(PrefsConstants.hasSeenOnboarding) ?? false;
  }
}