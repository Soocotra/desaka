import 'appointment_model.dart';
import 'meeting_model.dart';
import 'support_ticket_model.dart';
import 'visit_model.dart';

class Activity {
  final List<Appointment>? appointment;
  final List<Meeting>? meeting;
  final List<SupportTicket>? supportTicket;
  final List<Visit>? visit;

  Activity({this.appointment, this.meeting, this.supportTicket, this.visit});
}
