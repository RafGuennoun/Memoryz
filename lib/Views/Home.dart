import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Controllers/Auth_controller.dart';
import 'package:memoryz/Controllers/HomeController.dart';
import 'package:memoryz/Views/Memz.dart';
import 'package:memoryz/Views/Post.dart';
import 'package:memoryz/Views/Profil.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  final homeController = Get.find<HomeController>();

  final pages = [
    const Memz(),
    const Post(),
    const Profil()
  ];

  final double width = Get.width;
  final double height = Get.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: (){
              authController.signOut();
            }, 
          )
        ],
      ),

      body: SizedBox(
        width: width,
        height: height,
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => pages[controller.currentIndex]
        ),
      ),


      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller) => BottomNavigationBar(
          currentIndex: controller.currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Memz',
              icon: Icon(Icons.home_max_rounded)
            ),

            BottomNavigationBarItem(
              label: 'Post',
              icon: Icon(Icons.add_box_outlined)
            ),

            BottomNavigationBarItem(
              label: 'Profil',
              icon: Icon(CupertinoIcons.person_solid)
            ),
          ],
          onTap: (index){
            controller.changePage(index);
          },
        )
      ),

    );
  }
}