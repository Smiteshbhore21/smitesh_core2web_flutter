import 'package:shared_preferences/shared_preferences.dart';

class LoginSession {
  static bool isLoggin = false;
  static Future<void> setLoginSession(bool isLogin) async {
    SharedPreferences spObj = await SharedPreferences.getInstance();

    spObj.setBool("login", isLogin);

    getLoginSession();
  }

  static Future<void> getLoginSession() async {
    SharedPreferences spObj = await SharedPreferences.getInstance();
    isLoggin = spObj.getBool("login") ?? false;
  }
}
