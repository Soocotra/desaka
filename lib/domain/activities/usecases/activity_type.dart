abstract class ActivityScreenType {
  static const appointments = 'Appointments';
  static const meetings = 'Meetings';
  static const visit = 'Visits';
  static const supportTickets = 'Support Tickets';

  static String getCurrentType(String? params) {
    switch (params) {
      case ActivityScreenType.appointments:
        return ActivityScreenType.appointments;
      case ActivityScreenType.meetings:
        return ActivityScreenType.meetings;
      case ActivityScreenType.visit:
        return ActivityScreenType.visit;
      case ActivityScreenType.supportTickets:
        return ActivityScreenType.supportTickets;
      default:
        return ActivityScreenType.appointments;
    }
  }
}
