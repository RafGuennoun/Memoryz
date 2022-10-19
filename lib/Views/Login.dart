import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Controllers/Auth_controller.dart';
import 'package:memoryz/Themes/CustomTheme.dart';
import 'package:memoryz/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final controller = Get.find<AuthController>();

  final emailController =  TextEditingController();
  final pswController =  TextEditingController();

  bool? empty;
  
  @override
  Widget build(BuildContext context) {

    double width = Get.width;

    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  // ? Logo container
                  Hero(
                    tag: 'logo',
                    child: Container(
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
                  ),

                  const SizedBox(height: 20,),

                  Hero(
                    tag: "title",
                    child: Text(
                      "Memoryz",
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.titleLarge,
                    ),
                  ),
        
                  const SizedBox(height: 50,),
                  
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
        
                  const SizedBox(height: 50,),
                  
                  // ? Buttons
                  GetBuilder<AuthController>(
                    builder: (controller) => controller.loading 
                    ? const CircularProgressIndicator()
                    : Column(
                      children: [
      
                        CupertinoButton(
                            color: Get.theme.primaryColor,
                            child: const Text("Se connecter") , 
                            onPressed: (){

                              String email = emailController.text.trim();
                              String password = pswController.text.trim();

                              if (email.isEmpty || password.isEmpty) {
                                Get.snackbar(
                                  "Oups",
                                  "Veuillez remplir tous les champs",
                                );
                              } else {
                                controller.login(
                                  email, 
                                  password
                                );
                                
                              }


                            
                            }
                          ),
          
                        const SizedBox(height: 5,),
                        
                        CupertinoButton(
                          child: const Text("Créer un compte") , 
                          onPressed: (){
                            print("register");
                            Get.toNamed("/register");
                          }
                        ),
          
                      ],
                    ),
                  )
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}