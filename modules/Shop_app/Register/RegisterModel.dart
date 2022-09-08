class RegisterModel{
  bool? status;
  String? message;
  Registerdata? data;

  RegisterModel.fromJson(Map<String,dynamic> json){
    status = json["status"];
    message = json["message"];
    data = Registerdata.fromjson(json["data"]);
  }
}

class Registerdata{
  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;

  Registerdata.fromjson(Map<String,dynamic> json){
    name = json["name"];
    phone = json["phone"];
    email = json["email"];
    id = json["id"];
    image = json["image"];
    token = json['token'];
  }
}