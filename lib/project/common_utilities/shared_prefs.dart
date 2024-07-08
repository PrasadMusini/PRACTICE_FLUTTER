import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _prefs;

  static const String isVisitedOnBoarding = 'isVisitedOnBoarding';
  static const String isLoggedIn = 'isLoggedIn';

  static Future<SharedPreferences> getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool> getVisitStatus() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getBool(isVisitedOnBoarding) ?? false;
  }

  static Future<void> setVisitStatus({bool status = false}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setBool(isVisitedOnBoarding, status);
  }

  static Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await getPrefs();
    return prefs.getBool(isLoggedIn) ?? false;
  }

  static Future<void> setLoginStatus({bool status = false}) async {
    SharedPreferences prefs = await getPrefs();
    prefs.setBool(isLoggedIn, status);
  }
}
