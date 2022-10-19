import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:memoryz/Models/ProfileModel.dart';
import 'package:memoryz/Models/UserModel.dart';

class ProfileController extends GetxController{

  Rx<ProfileModel> profil = Rx<ProfileModel>(ProfileModel()); 
  Rx<UserModel> username = Rx<UserModel>(UserModel());
  ProfileModel get profilData => profil.value; 
  UserModel get usernameData => username.value; 

  @override
  void onInit() {
    super.onInit();
    profil.bindStream(getProfile());
    username.bindStream(getUsername());
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
}