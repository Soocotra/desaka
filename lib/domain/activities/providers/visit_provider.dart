import 'package:get/get.dart';

import '../visit_model.dart';

class VisitProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Visit.fromJson(map);
      if (map is List) return map.map((item) => Visit.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Visit?> getVisit(int id) async {
    final response = await get('visit/$id');
    return response.body;
  }

  Future<Response<Visit>> postVisit(Visit visit) async =>
      await post('visit', visit);
  Future<Response> deleteVisit(int id) async => await delete('visit/$id');
}
