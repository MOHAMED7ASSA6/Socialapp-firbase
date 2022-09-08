

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/Endpoint.dart';

import 'package:untitled/Network/remote/dio_helper.dart';
import 'package:untitled/layout/Shop_app/Cubit/states.dart';
import 'package:untitled/modules/Shop_app/products/ShopProductsModule.dart';
import 'package:untitled/modules/Shop_app/Login/loginmodel.dart';
import '../../../components/constants.dart';
import '../../../modules/Shop_app/Login/loginmodel.dart';
import '../../../modules/Shop_app/Register/RegisterModel.dart';
import '../../../modules/Shop_app/categories/CategoriesScreen.dart';
import '../../../modules/Shop_app/categories/categoriesModule.dart';
import '../../../modules/Shop_app/favorites/Change_Favorites_Model.dart';
import '../../../modules/Shop_app/favorites/Favorites_screen.dart';
import '../../../modules/Shop_app/favorites/Get_Favorites_Model.dart';
import '../../../modules/Shop_app/products/Products_screen.dart';
import '../../../modules/Shop_app/settings/Settings_screen.dart';

class ShopLayCubit extends Cubit<ShopStates> {
  ShopLayCubit() : super(ShopInitialState());

  static ShopLayCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> bottom=[
    ProductsScreen(),
    CategoriesScreen(),
    favoritesScreen(),
    SettingsScreen(),

  ];
  Map<int,bool> favorites={};
  IconData? FavIcon;

  CategoriesModel ?categoriesModel;
  void changeBottom(int index){
    
    currentIndex=index;
    emit(ShopChangeBottomNavState());
  }
  HomeModel ?homeModel;
void getHomeData(){
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME,  token:token,).then((value) {
      homeModel=HomeModel.fromJson(value.data);
      // printFullText(homeModel!.data!.banners.toString());
      // print(homeModel!.status);
      homeModel!.data!.products.forEach(( element) {
        favorites.addAll({
          element.id :element.inFavorites,
        });

      });
      // homeModel.data.products.forEach((element) {
      //   favorites.addAll({
      //     element.id:element.inFavorites
      //   });
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    }

    );
}

  List<bool> getCategories=[];
bool isDesktop=false;
void isdesktop(bool value){
  isDesktop=value;
  emit(IsDesktopselectState());
}
  ChangeFavoritesModel ?changeFavoritesModel;
  void getCategoriesData(){

    DioHelper.getData(url: Categories,  ).then((value) {

      categoriesModel=CategoriesModel.formJson(value.data);
      categoriesModel!.data.data.forEach((element) {
        getCategories.add(false);
      });



      // homeModel.data.products.forEach((element) {
      //   favorites.addAll({
      //     element.id:element.inFavorites
      //   });
      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoreisState());
    }

    );
  }
  void select(index) {
    for (int i = 0; i < getCategories.length; i++) {
      if(i==index)
      getCategories[i] = true;
    else
    getCategories[i] = false;
  }
    emit(selectState());
  }
  GetFavoritesModel ?getFavoritesModel;
  void getFavoritesData(){
    emit(ShopLoadingGetFavorietsState());

    DioHelper.getData(url: FAVORITES,token: token).then((value) {
      getFavoritesModel=GetFavoritesModel.fromJson(value.data);
      printFullText(value.data.toString());


      // homeModel.data.products.forEach((element) {
      //   favorites.addAll({
      //     element.id:element.inFavorites
      //   });
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetFavorietsState());
    }

    );
  }
  void Changefavories(int productId){
    if(favorites[productId] == true) {
      favorites[productId] = false;
      FavIcon = Icons.favorite;
    }
    else {
      favorites[productId] = true;
      FavIcon = Icons.favorite_border;
      getFavoritesData();
    }
    emit(ShopChangeFavorietsState());
  DioHelper.postData(url: FAVORITES, data: {
    'product_id':productId,

  },token:token,).then((value) {
    changeFavoritesModel=ChangeFavoritesModel.fromJson(value.data);
    print(value.data);
    getFavoritesData();
    if(!changeFavoritesModel!.status!){
      if(favorites[productId] == true) {
        favorites[productId] = false;
        FavIcon = Icons.favorite;
      }
      else  {
        favorites[productId] = true;
        FavIcon = Icons.favorite_border;
      }
    }
    emit(ShopSuccessChangeFavorietsState(changeFavoritesModel!));
  }).catchError((error){
    emit(ShopErrorChangeFavorietsState());
  });
  }

  //////////////////////dsd

  //////////////

  ShopLoginModel ?shopLoginModel;
  void getUserData(){
    emit(ShopLoadingUserDataState());
    DioHelper.getData(url: PROFILE,  token:token,).then((value) {
      shopLoginModel=ShopLoginModel.fromjson(value.data);


      emit(ShopSuccessUserDataState (shopLoginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUserState());
    }

    );
  }
  void updateUserData({
    required String email,
    required String phone,
    required String name,
}){
    emit(ShopLoadingUpdateaState());
    DioHelper.puttData(url: UPDATA_profile,  token:token, data: {
      'name':name,
      'email':email,
      'phone':phone,


    },).then((value) {
      shopLoginModel=ShopLoginModel.fromjson(value.data);


      emit(ShopSuccessUpdateState (shopLoginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorupdateState());
    }

    );
  }
}
// print(homeModel!.status);
// userModel!.data!.products.forEach(( element) {
//   favorites.addAll({
//     element.id :element.inFavorites,
//   });
//
// });
// homeModel.data.products.forEach((element) {
//   favorites.addAll({
//     element.id:element.inFavorites
//   });