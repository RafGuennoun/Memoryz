import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memoryz/Models/UserModel.dart';

class FirestoreUser {
  final CollectionReference usersCollectionRef = 
    FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestore(UserModel user) async {
    return await usersCollectionRef
      .doc(user.id)
      .set(user.toJson());
  }



}