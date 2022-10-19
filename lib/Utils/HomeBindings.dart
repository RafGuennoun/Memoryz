import 'package:get/get.dart';
import 'package:memoryz/Controllers/Home_controller.dart';

class HomeBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
  }

}