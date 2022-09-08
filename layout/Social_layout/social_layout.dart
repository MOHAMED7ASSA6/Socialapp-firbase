import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/styles/IconsBroken.dart';


import '../../modules/Scocial _app/Post/post.dart';
import 'cubit/cubit.dart';
import 'cubit/stats.dart';

class SocialLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(builder: (context,state){
      var cubit=SocialCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(cubit.Tirles[cubit.currentIndex]),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(
              IconBroken.Notification,
            )),
            IconButton(onPressed: (){}, icon: Icon(
              IconBroken.Search,
            ))
          ],


        ),
        body:cubit.Screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.ChangeBottomNav(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(IconBroken.Home,),
            label: 'Home'
            ),
            BottomNavigationBarItem(icon: Icon(IconBroken.Chat,),
                label: 'Chat'
            ),
            BottomNavigationBarItem(icon: Icon(IconBroken.Paper_Upload,),
                label: 'Post'
            ),
            BottomNavigationBarItem(icon: Icon(IconBroken.User,),
                label: 'User'
            ),
            BottomNavigationBarItem(icon: Icon(IconBroken.Setting,),
                label: 'Setting'
            ),
          ],
        ),

      );
    }, listener:(context,state){
    if(state is  SocialNEWPOSTState){
      navigateTo(context, Postscreen());
    }
    });
  }
}
