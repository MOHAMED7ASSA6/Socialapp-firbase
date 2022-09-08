



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/modules/Shop_app/Login/ShopLoginScreen.dart';

import '../Network/local/Cache_helper.dart';

void printFullText(String text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) =>print(match.group(0)));
}
String ?token='';
String ?uId='';
void SignOut(context) {
  cacheHelper.removeData(key: 'token').then(
          (value) {
            if (value) {
              navigateTorout(context, ShopLoginScrean());
            }
          });
}
// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../Network/local/Cache_helper.dart';
// import '../modules/Shop_app/Login/ShopLoginScreen.dart';
//
//
//
//
// class MyBlocObserver extends BlocObserver {
//   @override
//   void onCreate(BlocBase bloc) {
//     super.onCreate(bloc);
//     print('onCreate -- ${bloc.runtimeType}');
//   }
//
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     print('onChange -- ${bloc.runtimeType}, $change');
//   }
//
//   @override
//   void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//     print('onError -- ${bloc.runtimeType}, $error');
//     super.onError(bloc, error, stackTrace);
//   }
//
//   @override
//   void onClose(BlocBase bloc) {
//     super.onClose(bloc);
//     print('onClose -- ${bloc.runtimeType}');
//   }
// }
//
// void SignOut(context) {
//   cacheHelper.DeleteData(key: 'token').then(
//         (value) {
//       if (value) {
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//               builder: (BuildContext context) => ShopLoginScreen()),
//               (Route<dynamic> route) => false,
//         );
//       }
//     },
//   );
// }
//
// String? token ;
//
//
//
// // class PasswordVisibility{
// //   bool isPassword;
// //   IconData? suffixIcon;
// //
// //   PasswordVisibility({
// //     this.isPassword = true,
// //     this.suffixIcon = Icons.visibility,}
// //   ){
// //     isPassword =! isPassword!;
// //     suffixIcon == isPassword ?Icons.visibility:Icons.visibility_off;
// //     ShopLoginCubit.get(context).Passon();
// //   }
// Container(
//   height: 50,
//   color: Colors.amber.withOpacity(.6),
//   child: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: Row(
//       children: [
//         Icon(Icons.info_outline),
//         SizedBox(width: 20,),
//         Expanded(child: Text('please verify your email')),
//         Spacer(),
//         SizedBox(width: 20,),
//         defaultButton(function: (){
//           FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value)
//           {
//             showToast(text: 'chech your email', state: ToastStates.SUCCESS);
//           }
//           ).catchError((error){});
//         }, text: 'send',
//           background: Colors.amber.withOpacity(.6),
//           width: 80,
//         ),
//
//
//       ],
//     ),
//   ),
// )


