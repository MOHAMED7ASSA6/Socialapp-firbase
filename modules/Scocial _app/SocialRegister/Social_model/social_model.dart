

class  SocialDataModel{
 late String name;
  String ?email;
  String ?phone;
 late String uId;
 late String image;
  String ?bio;
  String ?cover;
// String ?SendImage;
  bool ?isEmailVerified;


  SocialDataModel({
    this.email,
   required this.name,
    this.phone,
  required this.uId,
   required this.image,
    this.bio,
    this.cover,
    this.isEmailVerified,
 //   this.SendImage,
  });
  SocialDataModel.fromjson(Map<String,dynamic>json){
    email=json['email'];
    name=json['name'];
    phone=json['phone'];
    uId=json['uId'];
    image=json['image'];
    bio=json['bio'];
    cover=json['cover'];
    isEmailVerified=json['isEmailVerified'];
  //  SendImage=json['SendImage'];


  }
  Map<String,dynamic> toMap(){
    return{
      'email':email,
      'name':name,
      'phone':phone,
      'image':image,
      'uId':uId,
      'bio':bio,
      'cover':cover,
      'isEmailVerified':isEmailVerified,
     // 'SendImage':SendImage,

    };
  }
}