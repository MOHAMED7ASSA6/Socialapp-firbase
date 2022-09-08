class ChangeFavoritesModel{

  bool? status;
  String? message;
  ChangeFavoritesdata? data;


  ChangeFavoritesModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    data = ChangeFavoritesdata.fromJson(json['data']);
  }

}

class ChangeFavoritesdata{
  int? id;
  dynamic price;
  dynamic old_price;
  int? discount;
  String? image;

  ChangeFavoritesdata.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
  }

}