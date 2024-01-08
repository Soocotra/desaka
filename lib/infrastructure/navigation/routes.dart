// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return MEETING;
  }

  static const ADD_APPOINTMENT = '/add-appointment';
  static const ADD_MEETING = '/add-meeting';
  static const ADD_SUPPORT_TICKET = '/add-support-ticket';
  static const ADD_VISIT = '/add-visit';
  static const APPOINTMENT = '/appointment';
  static const ATTENDANCE = '/attendance';
  static const AUTH_CHECK_AUTH = '/auth-check-auth';
  static const AUTH_LOGIN = '/auth-login';
  static const HOME = '/home';
  static const LANDING = '/landing';
  static const MEETING = '/meeting';
  static const SUPPORT_TICKET = '/support-ticket';
  static const VISIT = '/visit';
}
