import 'package:get/get.dart';

class HomeController extends GetxController{

  int currentIndex = 0;

  changePage(int index){
    currentIndex = index;
    update();
  }
}