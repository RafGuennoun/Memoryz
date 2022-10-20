import 'package:get/get.dart';

class PostController extends GetxController{

  List<Map<String, dynamic>> pics = [];
  List<String> urls = [];

  bool uploading = false;


  addPic(Map<String, dynamic> pic){
    pics.add(pic);
    update();
  }

  removePic(Map<String, dynamic> pic){
    pics.remove(pic);
    update();
  }

  clearPics(){
    pics.clear();
    update();
  }

  addURL(String url){
    urls.add(url);
    update();
  }

  clearURLs(){
    urls.clear();
    update();
  }

  // removePic(Map<String, dynamic> pic){
  //   pics.remove(pic);
  //   update();
  // }

  setUpload(){
    uploading = true;
    update();
  }

  doneUpload(){
    uploading = false;
    update();
  }

}