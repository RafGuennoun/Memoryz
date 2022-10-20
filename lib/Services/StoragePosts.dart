import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StoragePosts {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile( String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await storage.ref("memoryz/$fileName").putFile(file);

    } on FirebaseException catch(e){
      print(e);
    } catch (e) {
      print(e);
    }
  }

  Future<String> getURL(String imageName) async {
    String url = await storage.ref("memoryz/$imageName").getDownloadURL();
    return url;
  }

}