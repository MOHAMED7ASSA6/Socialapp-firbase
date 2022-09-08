import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/local/Cache_helper.dart';
import 'package:untitled/Network/remote/dio_helper.dart';
import 'package:untitled/modules/Shop_app/search/Cubit/states.dart';
import 'package:untitled/modules/Shop_app/search/Search_Model.dart';

import '../../../../Network/Endpoint.dart';
import '../../../../components/constants.dart';

class ShopCubitSearch extends Cubit<ShopSearchStates>{
  ShopCubitSearch(): super(ShopSearchInitialState());
  static ShopCubitSearch get(context) => BlocProvider.of(context);

  SearchModel?searchModel;
   void Searchmodel(String text){
     emit(ShopLoadingSearchState());
    DioHelper.postData(url:SEARCH , data:{
    'text':text,},token:token,
    ).then((value) {
      searchModel=SearchModel.fromJson(value.data);
      emit(ShopSuccessSearchState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorupSearchState());
    });


   }
}