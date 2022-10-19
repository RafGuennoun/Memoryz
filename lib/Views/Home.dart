import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Controllers/Auth_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CupertinoButton(
              color: Get.theme.primaryColor,
              child: const Text("Get Data"), 
              onPressed: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                print(auth.currentUser!.email);
              }
            ),

            const SizedBox(height: 35,),

            CupertinoButton(
              color: Get.theme.primaryColor,
              child: const Text("Se deconnecter"), 
              onPressed: (){
                controller.signOut();
              }
            ),
          ],
        ),
      ),
    );
  }
}