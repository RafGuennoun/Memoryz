import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memoryz/Models/ProfileModel.dart';

class FirestoreProfile {

  // FirebaseAuth auth = FirebaseAuth.instance;
  
  final CollectionReference profileCollectionRef = 
    FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).collection('Profile');

  Future<void> initProfileInFirestore(ProfileModel profile) async {
    return await profileCollectionRef
      .doc(profile.id)
      .set(profile.toJson());
  }


}