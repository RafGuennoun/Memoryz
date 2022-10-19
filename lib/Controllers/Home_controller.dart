import 'package:get/get.dart';

class HomeController extends GetxController{

  int currentIndex = 0;

  bool dark = Get.isDarkMode;

  changePage(int index){
    currentIndex = index;
    update();
  }

  switchTheme(){
    dark = !dark;
    update();
  }
}