import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memoryz/Controllers/Profile_controller.dart';
import 'package:memoryz/Views/PostData.dart';

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
                                      controller.nbPostsData.toString(),
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
                                      controller.nbLikesData.toString(),
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

                  const Divider(),

                  // const SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Mes memoryz ",
                        style: Get.theme.textTheme.titleLarge,
                      ),

                      GetBuilder<ProfileController>(
                        builder: (controller) => IconButton(
                        icon: controller.isList
                        ? const Icon(CupertinoIcons.square_grid_2x2)
                        : const Icon(CupertinoIcons.list_bullet),
                        onPressed: (){
                          if (controller.isList) {
                            controller.swithToGrid();
                          } else {
                            controller.swithToList();
                          }
                        }, 
                      )
                      )
                    ],
                  ),

                  GetBuilder<ProfileController>(
                    builder: (controller) => SizedBox(
                      width: width,
                      child: controller.nbPostsData == 0
                      ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text(
                          "Vous n'avez pas encore de memoryz",
                          textAlign: TextAlign.center,
                        ),
                      )
                      : controller.isList
                      ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.postData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  controller.postData[index].title!,
                                  style: Get.theme.textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            onTap: (){
                              print("show with details");
                              Get.to(PostData(post: controller.postData[index]));
                            },
                          );
                        },
                      )
                      : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.postData.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2
                        ), 
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Card(
                              child: Center(
                                child: Text(
                                  controller.postData[index].title!,
                                  textAlign: TextAlign.center,
                                  style: Get.theme.textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            onTap: (){
                              print("show with details");
                              Get.to(PostData(post: controller.postData[index]));
                            },
                          );
                        },
                      )
                    )

                  )
                

                  

                  


                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}