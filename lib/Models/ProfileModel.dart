import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String? id; 
  int? memz; 
  int? likes; 

  ProfileModel({this.id, this.memz, this.likes});

  ProfileModel.fromJson(DocumentSnapshot map){
    id = map['id'];
    memz = map['memz'];
    likes = map['likes'];
  }

  toJson(){
    return {
      "id" : id,
      "memz" : memz,
      "likes" : likes,
    };
  }

  @override
  String toString() {
    return "id = $id / memz = $memz / likes = $likes";
  }
}