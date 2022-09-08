

import 'dart:convert';

class  MassageModel{
 late String sinderId;
  late String recevierId;
 late  String dateTime;
late  String messagetext;
 //late String SendImage;


  MassageModel({
required    this.sinderId,
 required this.recevierId,
   required  this.dateTime,
   required  this.messagetext,
//    required  this.SendImage,


  });
  MassageModel.fromjson(Map<String,dynamic>json){
    sinderId=json['sinderId'];
    recevierId=json['recevierId'];
    dateTime=json['dateTime'];
    messagetext=json['messagetext'];
  //  SendImage=json['SendImage'];

  }
  Map<String,dynamic> toMap(){
    return{
      'sinderId':sinderId,
      'recevierId':recevierId,
      'dateTime':dateTime,
      'messagetext':messagetext,
    //  'SendImage':SendImage,


    };
  }
  // factory MassageModel.fromMap(Map<String, dynamic> map) {
  //   return MassageModel(
  //     sinderId: map['sinderId'],
  //     recevierId: map['recevierId'],
  //     dateTime: map['dateTime'],
  //     messagetext: map['messagetext'],
  //   );
  // }
  //
  // String toJson() => json.encode(toMap());
  //
  // factory MassageModel.fromJson(String source) =>
  //     MassageModel.fromMap(json.decode(source));
}