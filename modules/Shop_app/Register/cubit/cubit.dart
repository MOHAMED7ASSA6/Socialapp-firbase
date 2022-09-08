






import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/Shop_app/Register/cubit/states.dart';

import '../../../../Network/Endpoint.dart';
import '../../../../Network/remote/dio_helper.dart';
import '../../Login/loginmodel.dart';

class ShopRegisteCubit extends Cubit<ShopRegisteState> {
  ShopRegisteCubit() : super(ShopRegisteInitialState());

  static ShopRegisteCubit get(context) => BlocProvider.of(context);

late  ShopLoginModel loginModel;

  void userRegiste({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(ShopRegisteLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'phone' :phone,
        'name':name,
      },
    ).then((value) {


      print(value.data);
  loginModel=  ShopLoginModel.fromjson(value.data);



    emit(ShopRegisteSuccessState(loginModel));
      // print(LoginModel!.message);
      // print(LoginModel!.status);
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisteErrorState(error.toString()));
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
   emit(ShopRegisteIsPasswordState());
  }

}