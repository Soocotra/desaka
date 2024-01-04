import 'package:flutter/material.dart';

import '../../../presentation/activities/screen/appointment_view.dart';
import '../../../presentation/activities/screen/meeting_view.dart';
import '../../../presentation/activities/screen/support_ticket_view.dart';
import '../../../presentation/activities/screen/visit_view.dart';

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

  static Widget getBodyPage(String? params) {
    switch (params) {
      case ActivityScreenType.appointments:
        return const AppointmentView();
      case ActivityScreenType.meetings:
        return const MeetingView();
      case ActivityScreenType.visit:
        return const VisitView();
      case ActivityScreenType.supportTickets:
        return const SupportTicketView();
      default:
        return const AppointmentView();
    }
  }
}
