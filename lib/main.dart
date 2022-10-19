import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Themes/CustomTheme.dart';
import 'package:memoryz/Views/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
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
        
      home: const Login()
    );
  }
}
