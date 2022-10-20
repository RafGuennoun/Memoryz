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
    return const Scaffold(

      body: Text("Memz"),
    );
  }
}