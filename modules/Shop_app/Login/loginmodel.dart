class ShopLoginModel
{
  bool? status;
  String? message;
  UserData? data ;

  ShopLoginModel.fromjson(Map<String , dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromjson(json['data']) : null;
  }

}

class UserData
{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData.fromjson(Map<String , dynamic> json)
  {
    email = json['email'];
    credit = json['credit'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    points = json['points'];
    token = json['token'];
  }
}