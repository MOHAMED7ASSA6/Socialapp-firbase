





import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/Scocial%20_app/Social_login/cubit/states.dart';


import 'package:untitled/modules/Shop_app/Login/cubit/states.dart';

import '../../../../Network/Endpoint.dart';
import '../../../../Network/remote/dio_helper.dart';



class SocialLoginCubit extends Cubit<SocialLoginState> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

//late  ShopLoginModel loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());
FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
    password: password).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(SocialLoginSuccessState(value.user!.uid));

}).catchError((error){
      emit(SocialLoginErrorState(error.toString()));
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

  void Passon(){
   isPassword=! isPassword;
   sufix=isPassword?Icons.visibility:Icons.visibility_off;
   emit(SocialIsPasswordState());
  }

}