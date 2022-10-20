
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:memoryz/Controllers/Post_controller.dart';
import 'package:memoryz/Models/PostModel.dart';
import 'package:memoryz/Services/FirestrorePost.dart';
import 'package:memoryz/Services/StoragePosts.dart';

class Post extends StatelessWidget {
  Post({Key? key}) : super(key: key);

  final width = Get.width;
  final height = Get.height;

  final titleController =  TextEditingController();
  final descController =  TextEditingController();

  final PostController postCont = Get.put(PostController());

  final postController = Get.find<PostController>();

  final StoragePosts storagePosts = StoragePosts();

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
        
                  Text(
                    "Nouveau post",
                    style: Get.theme.textTheme.titleLarge,
                  ),
                  
                  const SizedBox(height: 20,),
                  
                  TextField(
                    controller: titleController,
                    autofocus: false,
                    autocorrect: false,
                    minLines: 1,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        // borderSide: const BorderSide(color: Colors.grey),
                      ),
                      labelText: "Titre",
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      hintText: "Le titre de votre post",
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
        
                  const SizedBox(height: 20,),
        
                  TextField(
                    controller: descController,
                    autofocus: false,
                    autocorrect: false,
                    minLines: 1,
                    maxLines: 200,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        // borderSide: const BorderSide(color: Colors.grey),
                      ),
                      labelText: "Desciption",
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      hintText: "Racontez nous quelque chose",
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
        
                  const SizedBox(height: 20,),

                  GetBuilder<PostController>(
                    init: PostController(),
                    builder: (controller) => controller.pics.isEmpty
                    ? SizedBox(
                      width: width,
                      height: 100,
                      child: DottedBorder(
                        color: Get.isDarkMode ? Get.theme.primaryColor : Colors.grey,
                        strokeWidth: 1,
                        dashPattern: const [8, 4],
                        child: Center(
                          child: Icon(
                            CupertinoIcons.photo_fill_on_rectangle_fill,
                            size: 45,
                            color: Get.isDarkMode ? Get.theme.primaryColor : Colors.grey,
                          )
                        ),
                      ),
                    )
                    : SizedBox(
                      width: width,
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.pics.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onLongPress: (){
                              postController.removePic(controller.pics[index]);
                              Get.snackbar(
                                "Supprimé", 
                                "L'image a été supprimé"
                              );
                            },
                            child: SizedBox(
                              width: 250,
                              height: 250,
                              child: Image.file(
                                File(controller.pics[index]["path"])
                              ),
                            ),
                          ),
                        )
                      ),
                    )
                  ),
        
                  const SizedBox(height: 10,),
        
                  SizedBox(
                    width: width,
                    child: GetBuilder<PostController>(
                      builder: (controller) => controller.uploading
                      ? const Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                      : Column(
                        children: [
                          CupertinoButton(
                            child: const Text("Ajouter une image"), 
                            onPressed: () async {
                              print("Ajouter image");
                              final results = await FilePicker.platform.pickFiles(
                                allowMultiple: false,
                                type: FileType.custom,
                                allowedExtensions: ['png', 'jpg']
                              );

                              if (results == null) {
                                Get.snackbar(
                                  "No File", 
                                  "No file selected"
                                );
                                return;
                              }

                              postController.setUpload();

                              final path = results.files.single.path;
                              final name = results.files.single.name;

                              Map<String, dynamic> pic = {
                                "path" : path,
                                "name" : name
                              };

                              List<String> urls = [];

                              storagePosts.uploadFile(
                                pic["path"], 
                                pic["name"]
                              ).whenComplete(() async {
                                await storagePosts.getURL(pic["name"]).then((url){
                                  urls.add(url);
                                  postController.addURL(url);
                                  print("------------------------------------------------------------");
                                  print("URL = $url");
                                  print("------------------------------------------------------------");
                                }).whenComplete((){
                                  postController.doneUpload();
                                  postController.addPic(pic);
                                });
                              });

                            }
                          ),
                         
                          const SizedBox(height: 20,),
                         
                          CupertinoButton(
                            color: Get.theme.primaryColor, 
                            onPressed: (){
                              String title = titleController.text.trim().capitalize!;
                              String desc = descController.text.trim().capitalize!;

                              if (title.isEmpty && desc.isEmpty) {
                                Get.snackbar(
                                  "Oups !", 
                                  "Veuillez ecrire quelque chose d'abord"
                                );
                              } else if (title.isEmpty){
                                Get.snackbar(
                                  "Oups !", 
                                  "Votre post doit avoir un titre"
                                );

                              } else if (title.isEmpty){
                                Get.snackbar(
                                  "Oups !", 
                                  "Racontez nous quelques choses"
                                );

                              } else {
                                DateTime now = DateTime.now();
                                String date = DateFormat.yMd().add_jms().format(now)
                                  .trim()
                                  .replaceAll("/","*")
                                  .replaceAll(" ","-");

                                List<Map<String, dynamic>> pics = postController.pics;

                                PostModel post = PostModel(
                                  date: date,
                                  title: title,
                                  desc: desc,
                                  pics: controller.urls,
                                  likes: 0
                                );

                                print(post.toString());
                                postController.setUpload();

                                FirestorePost().addPostToFirestore(post).whenComplete((){
                                  
                                  postController.doneUpload();
                                  postController.clearPics();
                                  postController.clearURLs();
                                  titleController.text = "";
                                  descController.text = "";

                                  Get.snackbar(
                                    "Nouveau post", 
                                    "Votre post a été ejouté avec succées a votre profil"
                                  );
                                });

                              }
                            },
                            child: const Text("Poster"),
                          ),
                        ],
                      ),
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