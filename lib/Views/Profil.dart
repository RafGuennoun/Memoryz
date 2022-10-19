import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Controllers/Profile_controller.dart';

class Profil extends StatelessWidget {
  Profil({Key? key}) : super(key: key);

  final double width = Get.width; 
  final ProfileController profileController = Get.put(ProfileController());

  FirebaseAuth auth = FirebaseAuth.instance;

  final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
    .collection('Users')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection('Profile')
    .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
    .snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  // ? Profil data 
                  Column(
                    children: [
                      SizedBox(
                        width: width*0.4,
                        height: width*0.4,
                        child: const CircleAvatar(
                          child: Icon(
                            Icons.person,
                            size: 75,
                          )
                        ),
                      ),

                      const SizedBox(height: 20,),

                      GetX<ProfileController>(
                        init: ProfileController(),
                        builder: (controller) => Column(
                          children: [

                            Text(
                              controller.usernameData.username.toString(),
                              style: Get.theme.textTheme.titleLarge,
                            ),

                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      controller.profilData.memz.toString(),
                                      style: Get.theme.textTheme.titleLarge,
                                    ),
                                    Text(
                                      "Memz",
                                      style: Get.theme.textTheme.bodyMedium,
                                    )
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text(
                                      controller.profilData.likes.toString(),
                                      style: Get.theme.textTheme.titleLarge,
                                    ),
                                    Text(
                                      "J'aimes",
                                      style: Get.theme.textTheme.bodyMedium,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                      )

                      
                      
                    ],
                  ),

                  const SizedBox(height: 15,),

                  const Divider(thickness: 3 ,color: Colors.red,),

                  // const SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Mes memz ",
                        style: Get.theme.textTheme.titleLarge,
                      ),

                      IconButton(
                        icon: const Icon(CupertinoIcons.list_bullet),
                        onPressed: (){
                          print("switch to wahda wahda");
                        }, 
                      )
                    ],
                  ),
                  // StreamBuilder(
                  //   stream: usersStream,
                  //   builder:(context, AsyncSnapshot<QuerySnapshot> snapshot){
                  //     if (!snapshot.hasData) {
                  //       return const Text('Makach data');
                  //     } else {
                  //       return Text("data = ${(snapshot.data!.docs[0])['likes']}");
                  //     }
                  //   }
                  // ),

                  

                  


                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}