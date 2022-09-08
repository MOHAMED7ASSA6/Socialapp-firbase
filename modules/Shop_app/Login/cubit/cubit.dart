





import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/Shop_app/Login/cubit/states.dart';

import '../../../../Network/Endpoint.dart';
import '../../../../Network/remote/dio_helper.dart';
import '../loginmodel.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

late  ShopLoginModel loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {


      print(value.data);
  loginModel=  ShopLoginModel.fromjson(value.data);



    emit(ShopLoginSuccessState(loginModel));
      // print(LoginModel!.message);
      // print(LoginModel!.status);
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
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
   emit(ShopIsPasswordState());
  }

}