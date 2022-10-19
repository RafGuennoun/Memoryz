import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Themes/CustomTheme.dart';
import 'package:memoryz/Views/Register.dart';
import 'package:memoryz/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController =  TextEditingController();
  final pswController =  TextEditingController();

  bool? empty;
  
  @override
  Widget build(BuildContext context) {

    double width = Get.width;
    double height = Get.height;

    return Scaffold(

      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                // ? Logo container
                Container(
                  width: width*0.6,
                  height: width*0.6,
                  color: Theme.of(context).primaryColor,
                  child: ElevatedButton(
                    child:const Text("Theme"),
                    onPressed: (){
                      print('theme');
                      if (Get.isDarkMode) {
                        Get.changeTheme(CustomTheme.customLightTheme);
                        prefs!.setBool('dark', false);
                      } else {
                        Get.changeTheme(CustomTheme.customDarkTheme);
                        prefs!.setBool('dark', true);
                      }
                    }, 
                  ),
                ),
      
                // ? Text fields
                Column(
                  children: [
                    TextField(
                      controller: emailController,
                      autofocus: false,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          // borderSide: const BorderSide(color: Colors.grey),
                        ),
                        labelText: "Email",
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        hintText: "Votre adresse email",
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        errorText: empty == true ? 'Ecrivez votre adresse email' : null
                      ),
                      onChanged: (newText){
                        setState(() {
                          empty = false;
                        });
                      },
                    ),
      
                    const SizedBox(height: 20,),
      
                    TextField(
                      controller: pswController,
                      autofocus: false,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          // borderSide: const BorderSide(color: Colors.grey),
                        ),
                        labelText: "Mot de passe",
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        hintText: "Votre mot de passe",
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        errorText: empty == true ? 'Ecrivez votre mot de passe' : null
                      ),
                      onChanged: (newText){
                        setState(() {
                          empty = false;
                        });
                      },
                    ),

                   
                  ],
                ),
      
                // ? Buttons
                Column(
                  children: [
                    CupertinoButton(
                      color: Get.theme.primaryColor,
                      child: const Text("Se connecter") , 
                      onPressed: (){
                        print("login");
                       
                      }
                    ),
      
                    const SizedBox(height: 5,),
                    
                    CupertinoButton(
                      child: const Text("Créer un compte") , 
                      onPressed: (){
                        print("register");
                        Get.to(const Register());
                      }
                    ),
      
                  ],
                ),
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}