






import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/Scocial%20_app/SocialRegister/cubit/states.dart';


import '../../../../Network/Endpoint.dart';
import '../../../../Network/remote/dio_helper.dart';
import '../Social_model/social_model.dart';


class SocialRegisteCubit extends Cubit<SocialRegisteState> {
  SocialRegisteCubit() : super(SocialRegisteInitialState());

  static SocialRegisteCubit get(context) => BlocProvider.of(context);

//late  SocialLoginModel loginModel;

  void userRegiste({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(SocialRegisteLoadingState());

FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,
    password: password,
).then((value) {

  userCreat(email: email, phone: phone, name: name, uId: value.user!.uid);

}).catchError((error){
  emit(SocialRegisteErrorState(error));
});
  }
  void userCreat({    required String email,

    required String phone,
    required String name,
    required String uId,
  }){
    SocialDataModel  model=SocialDataModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      bio:'writ you bio.....',
      cover: 'https://img.freepik.com/free-photo/cheerful-male-gives-nice-offer-advertises-new-product-sale-stands-torn-paper-hole-has-positive-expression_273609-38452.jpg?w=740&t=st=1659314474~exp=1659315074~hmac=bc5ca0389d8acc1fc3fa330ed3a8eda69ace24f1babe4b7806a29b4b493da4c7',
      image: 'https://img.freepik.com/premium-photo/waist-up-shot-handsome-smiling-european-adult-man-keeps-hand-rim-spectacles-wears-casual-jumper-being-good-mood-isolated-vivid-yellow-background-people-emotions-concept_273609-58969.jpg?w=740',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {
      emit(SocialCreatSuccessState());
    }).
    catchError((error){
      emit(SocialCreatErrorState(error));
    });
  }


  bool isPassword = true;
  // IconData? suffixIcon = Icons.visibility;
  // void Passon(){
  //   isPassword =! isPassword;
  //   suffixIcon = isPassword ?Icons.visibility:Icons.visibility_off;
  //   emit(ShopIsPasswordState());
  // }
IconData sufix=  Icons.remove_red_eye_rounded;

  void PassonRegiste(){
   isPassword=! isPassword;
   sufix=isPassword?Icons.visibility:Icons.visibility_off;
   emit(SocialRegisteIsPasswordState());
  }

}