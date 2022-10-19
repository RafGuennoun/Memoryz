class UserModel {
  String? id; 
  String? email; 
  String? username; 
  String? pic; 

  UserModel({this.id, this.email, this.username, this.pic});

  UserModel.fromJson(Map<dynamic, dynamic> map){
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