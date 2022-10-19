import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  // ? Logo container
                  Center(
                    child: Container(
                      width: width*0.5,
                      height: width*0.5,
                      color: Theme.of(context).primaryColor,
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
                  SizedBox(
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          color: Get.theme.primaryColor,
                          child: const Text("Créer le compte") , 
                          onPressed: (){
                            print("Register");
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
                  ),
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}