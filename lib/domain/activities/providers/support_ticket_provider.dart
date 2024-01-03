import 'package:get/get.dart';

import '../support_ticket_model.dart';

class SupportTicketProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return SupportTicket.fromJson(map);
      if (map is List) {
        return map.map((item) => SupportTicket.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<SupportTicket?> getSupportTicket(int id) async {
    final response = await get('supportticket/$id');
    return response.body;
  }

  Future<Response<SupportTicket>> postSupportTicket(
          SupportTicket supportticket) async =>
      await post('supportticket', supportticket);
  Future<Response> deleteSupportTicket(int id) async =>
      await delete('supportticket/$id');
}
