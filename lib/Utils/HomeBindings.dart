import 'package:get/get.dart';
import 'package:memoryz/Controllers/HomeController.dart';

class HomeBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
  }

}