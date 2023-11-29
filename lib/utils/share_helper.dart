import 'package:shared_preferences/shared_preferences.dart';
class ShareHelper {

  Future<void> setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("theme", isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = await shr.getBool("theme");
    return isTheme;
  }

  Future<void> profileOn(bool isVisible) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("profile", isVisible);
  }

  Future<bool?> profileOff() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isUnVisible = await shr.getBool("profile");
    return isUnVisible;
  }


}
