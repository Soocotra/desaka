// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return ACTIVITIES;
  }

  static const ACTIVITIES = '/activities/:type';
  static const ADD_APPOINTMENT = '/add-appointment';
  static const ADD_MEETING = '/add-meeting';
  static const ADD_VISIT = '/add-visit';
  static const ATTENDANCE = '/attendance';
  static const AUTH_CHECK_AUTH = '/auth-check-auth';
  static const AUTH_LOGIN = '/auth-login';
  static const HOME = '/home';
  static const LANDING = '/landing';
  static const ADD_SUPPORT_TICKET = '/add-support-ticket';
}
