import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:memoryz/Models/PostModel.dart';
import 'package:memoryz/Models/ProfileModel.dart';
import 'package:memoryz/Models/UserModel.dart';

class ProfileController extends GetxController{

  Rx<ProfileModel> profil = Rx<ProfileModel>(ProfileModel()); 
  ProfileModel get profilData => profil.value; 

  Rx<UserModel> username = Rx<UserModel>(UserModel());
  UserModel get usernameData => username.value; 

  Rx<List<PostModel>> posts = Rx<List<PostModel>>([PostModel()]);
  List<PostModel> get postData => posts.value;

  @override
  void onInit() {
    super.onInit();
    profil.bindStream(getProfile());
    username.bindStream(getUsername());
    posts.bindStream(getPosts());
  }

  Stream<ProfileModel> getProfile() {
    return FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Profile')
      .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots().map((QuerySnapshot query) {
        return ProfileModel.fromJson(query.docs[0]);
      });
  }


  Stream<UserModel> getUsername() {
    return FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots().map((DocumentSnapshot document){
         return UserModel.fromJson(document);
      });
  }

  Stream<List<PostModel>> getPosts(){
    return FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Posts')
      .snapshots().map((QuerySnapshot query){
        List<PostModel> posts = [];
        for (var doc in query.docs) {
          final post = PostModel.fromJson(doc); 
          posts.add(post);
        }
        return posts;
      });
  }


}