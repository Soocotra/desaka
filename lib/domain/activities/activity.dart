import 'appointment_model.dart';
import 'meeting_model.dart';
import 'support_ticket_model.dart';
import 'visit_model.dart';

class Activity {
  final Appointment? appointment;
  final Meeting? meeting;
  final SupportTicket? supportTicket;
  final Visit? visit;

  Activity(
      {required this.appointment,
      required this.meeting,
      required this.supportTicket,
      required this.visit});
}
