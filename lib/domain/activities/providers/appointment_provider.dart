import 'package:get/get.dart';

import '../appointment_model.dart';

class AppointmentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Appointment.fromJson(map);
      if (map is List) {
        return map.map((item) => Appointment.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Appointment?> getAppointment(int id) async {
    final response = await get('appointment/$id');
    return response.body;
  }

  Future<Response<Appointment>> postAppointment(
          Appointment appointment) async =>
      await post('appointment', appointment);
  Future<Response> deleteAppointment(int id) async =>
      await delete('appointment/$id');
}
