import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Controllers/Auth_controller.dart';
import 'package:memoryz/Controllers/Home_controller.dart';
import 'package:memoryz/Themes/CustomTheme.dart';
import 'package:memoryz/main.dart';

class Memz extends StatelessWidget {
  Memz({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: (){
              authController.signOut();
            }, 
          ),

          GetBuilder<HomeController>(
            init: HomeController(),
            builder:(controller) => Switch(
              value: controller.dark, 
              onChanged: (e){
                if (Get.isDarkMode) {
                  Get.changeTheme(CustomTheme.customLightTheme);
                  controller.switchTheme();
                  prefs!.setBool('dark', false);
                } else {
                  Get.changeTheme(CustomTheme.customDarkTheme);
                  controller.switchTheme();
                  prefs!.setBool('dark', true);
                }
              }
            )
          )
        ],
      ),
      
      body: const Text("Memz"),
    );
  }
}