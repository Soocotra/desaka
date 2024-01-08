import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String getHoursFormat() {
    return DateFormat('hh:mm a').format(this);
  }

  int getDate() {
    return day;
  }

  String getMMM() {
    return DateFormat.MMM().format(this);
    
  }
}
