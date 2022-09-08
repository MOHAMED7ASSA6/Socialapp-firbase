
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/layout/New_app/Cubit/states.dart';

import '../../../Network/remote/dio_helper.dart';
import '../../../modules/News_app/Busniess/Busniess.dart';
import '../../../modules/News_app/Science/ScienceScreen.dart';
import '../../../modules/News_app/Sports/SportsScreen.dart';

class NewsCubitt extends Cubit<NewsStates> {
  NewsCubitt() : super(NewsInitialState());

  static NewsCubitt get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changebottomnavbar(int index) {
    selectedIndex = index;
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsChangeBottomNavBar());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusninessLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apiKey": "aa6efe7293e7456d8006f5fe4181f0ea"
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title'].toString());
      emit(NewsGetBusninessSuccessState());
    }).catchError((error) {
      print("ERROR ${error.toString()}");
      emit(NewsGetBusninessErrorState(error.toString()));
    });
  }
  //

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "aa6efe7293e7456d8006f5fe4181f0ea"
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title'].toString());
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print("ERROR ${error.toString()}");
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }
  //

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "science",
        "apiKey": "aa6efe7293e7456d8006f5fe4181f0ea"
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title'].toString());
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print("ERROR ${error.toString()}");
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  //

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());


    DioHelper.getData(url: "v2/everything", query: {

      "q": "$value",
      "apiKey": "aa6efe7293e7456d8006f5fe4181f0ea"
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title'].toString());
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print("ERROR ${error.toString()}");
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }
}