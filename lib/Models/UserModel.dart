import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id; 
  String? email; 
  String? username; 
  String? pic; 

  UserModel({this.id, this.email, this.username, this.pic});

  UserModel.fromJson(DocumentSnapshot map){
    id = map['id'];
    email = map['email'];
    username = map['username'];
    pic = map['pic'];
  }

  toJson(){
    return {
      "id" : id,
      "email" : email,
      "username" : username,
      "pic" : pic,
    };
  }
}