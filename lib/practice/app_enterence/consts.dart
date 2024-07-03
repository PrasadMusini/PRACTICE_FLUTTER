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
  static const String isOnboardingVisited = "isOnboardingVisited";
  static const String isUserLoggedIn = "isUserLoggedIn";

  static Future<bool> getVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isOnboardingVisited) ?? false;
  }

  static Future<void> setVisited(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isOnboardingVisited, value);
  }

  static Future<bool> getLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isUserLoggedIn) ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUserLoggedIn, value);
  }
}
