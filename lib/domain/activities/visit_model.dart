import 'activity.dart';

class Visit extends Activity{
  String? title;
  String? description;
  String? startSchedule;
  String? endSchedule;
  String? location;
  String? attachment;

  Visit(
      {this.title,
      this.description,
      this.startSchedule,
      this.endSchedule,
      this.location,
      this.attachment});

  Visit.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    startSchedule = json['startSchedule'];
    endSchedule = json['endSchedule'];
    location = json['location'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['startSchedule'] = startSchedule;
    data['endSchedule'] = endSchedule;
    data['location'] = location;
    data['attachment'] = attachment;
    return data;
  }
}
