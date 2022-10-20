import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memoryz/Models/PostModel.dart';

class FirestorePost{

  final CollectionReference postsCollectionRef = 
    FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).collection('Posts');

  Future<void> addPostToFirestore(PostModel post) async {
    return await postsCollectionRef
      .doc(post.date)
      .set(post.toJson());
  }

}