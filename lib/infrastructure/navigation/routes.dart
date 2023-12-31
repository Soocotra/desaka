// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return AUTH_LOGIN;
  }

  static const AUTH_LOGIN = '/auth-login';
  static const HOME = '/home';
  static const AUTH_CHECK_AUTH = '/auth-check-auth';
}