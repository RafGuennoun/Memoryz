import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Controllers/Auth_controller.dart';
import 'package:memoryz/Themes/CustomTheme.dart';
import 'package:memoryz/Views/Home.dart';
import 'package:memoryz/Views/Login.dart';
import 'package:memoryz/Views/Register.dart';
import 'package:memoryz/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Memoryz',
      debugShowCheckedModeBanner: false,

      theme: prefs!.getBool("dark") == null 
        ?  CustomTheme.customLightTheme
        : prefs!.getBool("dark") == true 
        ? CustomTheme.customDarkTheme
        : CustomTheme.customLightTheme,
      
      initialRoute: "/",

      getPages: [
        GetPage(name: "/", page: ()=> const Login()),
        GetPage(name: "/register", page: ()=> const Register()),
        GetPage(name: "/home", page: ()=> const Home()),
      ],
    );
  }
}
