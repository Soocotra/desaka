import 'package:get/get.dart';

import '../meeting_model.dart';

class MeetingProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Meeting.fromJson(map);
      if (map is List) {
        return map.map((item) => Meeting.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Meeting?> getMeeting(int id) async {
    final response = await get('meeting/$id');
    return response.body;
  }

  Future<Response<Meeting>> postMeeting(Meeting meeting) async =>
      await post('meeting', meeting);
  Future<Response> deleteMeeting(int id) async => await delete('meeting/$id');
}
