

import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:untitled/styles/style.dart';

import 'Network/local/Cache_helper.dart';
import 'Network/remote/dio_helper.dart';
import 'components/components.dart';
import 'components/constants.dart';
import 'layout/New_app/Cubit/cubit.dart';
import 'layout/New_app/NewsLayout.dart';
import 'layout/Shop_app/Cubit/cubit.dart';
import 'layout/Shop_app/ShopLayout.dart';
import 'layout/Social_layout/cubit/cubit.dart';
import 'layout/Social_layout/social_layout.dart';
import 'layout/Todo_app/Cubit/cubit.dart';
import 'layout/Todo_app/Cubit/states.dart';
import 'modules/Scocial _app/Social_login/social_login_screen.dart';
import 'modules/Shop_app/Login/ShopLoginScreen.dart';
import 'modules/Shop_app/Login/cubit/cubit.dart';
import 'modules/Shop_app/on_boarding/on_boarding_screen.dart';
// Future<void>FirebaseMessagingBackgroundHandler(RemoteMessage message)async{
//   print('on background message');
//   print(message.data.toString());
//   showToast(state:ToastStates.SUCCESS ,text: 'on background message');
// }
void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
if(Platform.isWindows)
  await DesktopWindow.setMinWindowSize(
      Size(
    350,
    650,

  ));

  // await Firebase.initializeApp();
  // var token =await FirebaseMessaging.instance.getToken();
  // print(token);
  // FirebaseMessaging.onMessage.listen((event) {
  //   print('on message');
  //   print(event.data.toString());
  //   showToast(state:ToastStates.SUCCESS ,text: 'on message');
  // });
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print('on message opened app');
  //   print(event.data.toString());
  //   showToast(state:ToastStates.SUCCESS ,text: 'on message opened app');
  // });
  // FirebaseMessaging.onBackgroundMessage(FirebaseMessagingBackgroundHandler);
  DioHelper.dio;
  await cacheHelper.init();
  bool? isDark = cacheHelper.getData(key: 'isDark');
  Widget widget;
 // bool? onboarding = cacheHelper.getData(key: 'onboarding');

  //token = cacheHelper.getData(key: 'token');
  uId = cacheHelper.getData(key: 'uId');
 // print(token);
if(uId!=null){
  widget=SocialLayout();

}else{
  widget=SocialLoginScreen();
}

// if(onboarding !=null){
//   if(token != null) widget = ShopLayout();
//   else widget = ShopLoginScrean();
// } else {widget = OnBoardingScreen();}





  runApp(MyApp(
    isDark: isDark == null ? isDark == null : isDark,
    startWidget: widget,
 ));
}

class MyApp extends StatelessWidget
{
  final bool isDark;
  final Widget startWidget;
  // final bool OnBoarding;

  MyApp({
    required this.isDark,
    required this.startWidget,
    // required this.OnBoarding,

  });
  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
          create: (context)=>AppCubit()..changeAppMode(
            fromShared: isDark,
          ),),
        BlocProvider(
          create: (context) => NewsCubitt()..getBusiness(),),
        BlocProvider(
          create: (context) =>ShopLoginCubit(),
        ),
        BlocProvider(
          create: (context) => ShopLayCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..getUserData(),
        ),
        BlocProvider(
          create: (context) => SocialCubit()..getUserData()..getPost()..getAllUser(),
        ),

      ],
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context, state){},
        builder:(context ,state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lighttheme,
            darkTheme:darttheme,
            // themeMode: AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
            themeMode: ThemeMode.light,
            debugShowMaterialGrid: false,
            home:ShopLayout(),

          );
        },
      ),

    );
  }

}