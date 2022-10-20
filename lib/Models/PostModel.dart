import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? date; 
  String? title; 
  String? desc; 
  List<dynamic>? pics; 
  int? likes;

  PostModel({this.date, this.title, this.desc, this.pics, this.likes});

  PostModel.fromJson(DocumentSnapshot map){
    date = map['date'];
    title = map['title'];
    desc = map['desc'];
    pics = map['pics'];
    likes = map['likes'];
  }

  toJson(){
    return {
      "date" : date,
      "title" : title,
      "desc" : desc,
      "pics" : pics,
      "likes" : likes,
    };
  }

  @override
  String toString() {
    return "date = $date / title = $title / desc = $desc / likes = $likes";
  }
}