/* import 'package:shared_preferences/shared_preferences.dart';

var isOnboardingVisited = "seenOnboarding";
var isUserLoggedIn = "isUserLoggedIn";

Future<bool> getOnboarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(isOnboardingVisited) ?? false;
}

Future<void> setOnboarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(isOnboardingVisited, true);
}

Future<bool> getLoginInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(isUserLoggedIn) ?? false;
}

Future<void> setLoginInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(isUserLoggedIn, true);
} */

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  static const String isOnboardingVisited = "isOnboardingVisited";
  static const String isUserLoggedIn = "isUserLoggedIn";

  static Future<bool> getVisited() async {
    final SharedPreferences prefs = await getPrefs();
    return prefs.getBool(isOnboardingVisited) ?? false;
  }

  static Future<void> setVisited(bool? value) async {
    final SharedPreferences prefs = await getPrefs();
    prefs.setBool(isOnboardingVisited, value ?? false);
  }

  static Future<bool> getLoggedIn() async {
    final SharedPreferences prefs = await getPrefs();
    return prefs.getBool(isUserLoggedIn) ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await getPrefs();
    prefs.setBool(isUserLoggedIn, value);
  }
}
