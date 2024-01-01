import 'package:desaka/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final count = 0.obs;



  void increment() => Get.toNamed(Routes.AUTH_CHECK_AUTH);
}
