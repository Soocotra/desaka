import 'package:desaka/domain/activities/providers/appointment_provider.dart';
import 'package:flutter/material.dart';

import '../../../presentation/activities/screen/appointment_view.dart';
import '../../../presentation/activities/screen/meeting_view.dart';
import '../../../presentation/activities/screen/support_ticket_view.dart';
import '../../../presentation/activities/screen/visit_view.dart';
import '../activity.dart';

class ActivityScreenType {
  static const appointments = 'Appointments';
  static const meetings = 'Meetings';
  static const visit = 'Visits';
  static const supportTickets = 'Support Tickets';
  Widget bodyPage = const AppointmentView();
  String param = appointments;

  set setParam(String setParam) => param = setParam;

  String getCurrentType() {
    switch (param) {
      case ActivityScreenType.appointments:
        bodyPage = const AppointmentView();
        return ActivityScreenType.appointments;
      case ActivityScreenType.meetings:
        bodyPage = const MeetingView();
        return ActivityScreenType.meetings;
      case ActivityScreenType.visit:
        bodyPage = const VisitView();
        return ActivityScreenType.visit;
      case ActivityScreenType.supportTickets:
        bodyPage = const SupportTicketView();
        return ActivityScreenType.supportTickets;
      default:
        bodyPage = const MeetingView();
        return ActivityScreenType.appointments;
    }
  }

  Activity getModel() {
    switch (param) {
      case ActivityScreenType.appointments:
        return Activity(appointment: AppointmentProvider().getDummy());
      case ActivityScreenType.visit:
        return Activity(appointment: AppointmentProvider().getDummy());
      case ActivityScreenType.meetings:
        return Activity(appointment: AppointmentProvider().getDummy());
      case ActivityScreenType.supportTickets:
        return Activity(appointment: AppointmentProvider().getDummy());
      default:
        return Activity(appointment: AppointmentProvider().getDummy());
    }
  }
}
