// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return ACTIVITIES;
  }

  static const ATTENDANCE = '/attendance';
  static const AUTH_CHECK_AUTH = '/auth-check-auth';
  static const AUTH_LOGIN = '/auth-login';
  static const HOME = '/home';
  static const LANDING = '/landing';
  static const ACTIVITIES = '/activities';
}
