import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/local/Cache_helper.dart';

import '../../components/components.dart';
import '../../modules/Shop_app/Login/ShopLoginScreen.dart';
import '../../modules/Shop_app/search/Search_screen.dart';
import 'Cubit/cubit.dart';
import 'Cubit/states.dart';

class ShopLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayCubit, ShopStates>(
      listener: (state, context) => {},
      builder: (context, state) {
         return Scaffold(
          appBar: AppBar(
            title: Text('salla'),
            actions: [


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5,),
          child: IconButton(onPressed: (){
            navigateTo(context, SearchScreen());
          }, icon: Icon(Icons.search)),
        ),
            ],
          ),
          body:ShopLayCubit.get(context).bottom[ShopLayCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              ShopLayCubit.get(context).changeBottom(index);
            },
            currentIndex: ShopLayCubit.get(context).currentIndex,
            items: [

              BottomNavigationBarItem(icon:Icon( Icons.home),
                  label: 'home'
              ),
              BottomNavigationBarItem(icon:Icon( Icons.apps),
                  label: 'Categories'
              ),
              BottomNavigationBarItem(icon:Icon( Icons.favorite),
                  label: 'favorite'
              ),
              BottomNavigationBarItem(icon:Icon( Icons.settings),
                  label: 'settings'
              ),
            ],),



        );
      },
    );
  }
}


