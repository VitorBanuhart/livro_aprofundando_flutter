import 'package:new_project/app_constants/shared_preferences_contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static setWelcomeRead({required bool status}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(KWelcomeRead, status);
  }

  static getWelcomeRead() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(KWelcomeRead) ?? false;
  }
}
