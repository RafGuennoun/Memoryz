
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Controllers/Auth_controller.dart';
import 'package:memoryz/Themes/CustomTheme.dart';
import 'package:memoryz/main.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final controller = Get.find<AuthController>();

  final userController =  TextEditingController();
  final emailController =  TextEditingController();
  final pswController =  TextEditingController();
  final confirmPswController =  TextEditingController();

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
      
                  // ? Logo container
                  SizedBox(
                    width: width,
                    height: width*0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Hero(
                          tag: "logo",
                          child: Container(
                            width: width*0.3,
                            height: width*0.3,
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

                        Hero(
                          tag: "title",
                          child: Text(
                            "Memoryz",
                            textAlign: TextAlign.center,
                            style: Get.theme.textTheme.titleLarge,
                          ),
                        )
                      ],
                    ),
                  ),
      
                  const SizedBox(height: 35,),
                  
                  // ? Text fields
                  Column(
                    children: [
      
                      TextField(
                        controller: userController,
                        autofocus: false,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            // borderSide: const BorderSide(color: Colors.grey),
                          ),
                          labelText: "Nom d'utilisateur",
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          hintText: "Votre nom d'utilisateur",
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          errorText: empty == true ? "Ecrivez votre d'utilisateur" : null
                        ),
                        onChanged: (newText){
                          setState(() {
                            empty = false;
                          });
                        },
                      ),
      
                      const SizedBox(height: 20,),
      
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
      
                      const SizedBox(height: 20,),
        
                      TextField(
                        controller: confirmPswController,
                        autofocus: false,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            // borderSide: const BorderSide(color: Colors.grey),
                          ),
                          labelText: "Confirmer mot de passe",
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
      
                  const SizedBox(height: 35,),
        
                  // ? Buttons
                  GetBuilder<AuthController>(
                    builder: (controller) => controller.loading 
                    ? const CircularProgressIndicator()
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          color: Get.theme.primaryColor,
                          child: const Text("Créer le compte") , 
                          onPressed: (){

                            String usermane = userController.text.trim();
                            String email = emailController.text.trim();
                            String psw = pswController.text.trim();
                            String confirmation = confirmPswController.text.trim();

                            if (usermane.isEmpty ||email.isEmpty || psw.isEmpty || confirmation.isEmpty) {
                              Get.snackbar(
                                "Oups",
                                "Veuillez remplir tous les champs",
                              );
                            } else {
                              if (psw != confirmation) {
                                Get.snackbar(
                                  "Oups",
                                  "Verifiez votre mot de passe",
                                );
                              } else {
                                controller.register(
                                  usermane, 
                                  email, 
                                  psw
                                );
                              }
                            }

                
                          }
                        ),
        
                        const SizedBox(height: 5,),
                      
                        CupertinoButton(
                          child: const Text("J'ai déja un compte") , 
                          onPressed: (){
                            print("Login");
                            Get.back();
                          }
                        ),
          
                      ],
                    ),                    
                  )


                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     CupertinoButton(
                  //       color: Get.theme.primaryColor,
                  //       child: const Text("Créer le compte") , 
                  //       onPressed: (){

                  //         String usermane = userController.text.trim();
                  //         String email = emailController.text.trim();
                  //         String psw = pswController.text.trim();
                  //         String confirmation = confirmPswController.text.trim();

                  //         if (usermane.isEmpty ||email.isEmpty || psw.isEmpty || confirmation.isEmpty) {
                  //           Get.snackbar(
                  //             "Oups",
                  //             "Veuillez remplir tous les champs",
                  //           );
                  //         } else {
                  //           if (psw != confirmation) {
                  //             Get.snackbar(
                  //               "Oups",
                  //               "Verifiez votre mot de passe",
                  //             );
                  //           } else {
                  //             controller.register(
                  //               usermane, 
                  //               email, 
                  //               psw
                  //             );
                  //           }
                  //         }

              
                  //       }
                  //     ),
      
                  //     const SizedBox(height: 5,),
                    
                  //     CupertinoButton(
                  //       child: const Text("J'ai déja un compte") , 
                  //       onPressed: (){
                  //         print("Login");
                  //         Get.back();
                  //       }
                  //     ),
        
                  //   ],
                  // ),
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}