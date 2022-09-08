// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled/layout/Social_layout/cubit/stats.dart';
// import 'package:untitled/modules/Scocial%20_app/SocialRegister/Social_model/social_model.dart';
// import 'package:untitled/modules/Scocial%20_app/SocialRegister/Social_model/social_model.dart';
//
// import '../../../../layout/Social_layout/cubit/cubit.dart';
// import '../../../../styles/IconsBroken.dart';
//
// import '../../SocialRegister/Social_model/social_model.dart';
// import 'chats Model.dart';
//
// class Chatsmode extends StatelessWidget {
//
//   SocialDataModel ? UserModel;
//   MassageModel ?model;
//   Chatsmode({
//     this.UserModel,
//   });
//   var massagecontrorll=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Builder(builder: (BuildContext context){
//       SocialCubit.get(context).getMassage(receiverId: UserModel!.uId);
//       return BlocConsumer<SocialCubit,SocialState>(builder: (context,state){
//         //   var massage =SocialCubit.get(context).
//         return Scaffold(
//           appBar: AppBar(
//             titleSpacing: 0,
//             title: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 20,
//                   backgroundImage: NetworkImage('${UserModel!.image}'),
//                 ),
//                 SizedBox(width: 5,),
//                 Text('${UserModel!.name}'),
//               ],
//             ),
//           ),
//           body:Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//
//                 Expanded(
//                   child: ListView.separated(
//                     physics: BouncingScrollPhysics(),
//                     itemBuilder: (context,index){
//                       MassageModel message =
//                       SocialCubit.get(context).massage[index];
//
//                       if (SocialCubit.get(context).UserModel!.uId ==
//                           message.sinderId) {
//                         return buildMassage(message);
//                       }
//
//                       return buildmyMassage(message);
//                     },
//                     separatorBuilder: (context,index){
//                       return SizedBox(height: 15,);
//                     },
//                     itemCount:  SocialCubit.get(context).massage.length,
//                   ),
//                 ),
//
//                 Spacer(),
//                 Container(
//                   decoration: BoxDecoration(
//
//                     border: Border.all(
//                       width: 1,
//                       color:Colors.grey.shade300,
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//
//                   ),
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'type your message here ...',
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height:50,
//                         color: Colors.blue,
//                         child: MaterialButton(onPressed: (){
//                           SocialCubit.get(context).sendMassage(dateTime: DateTime.now().toLocal().toString(),
//                               receiverId:UserModel!.uId,
//                               messagetext: massagecontrorll.text,  );
//
//                         },
//                           minWidth: 1,
//                           child:
//                           Icon(IconBroken.Send,
//                             size: 16,
//                             color: Colors.white,
//                           )
//                           ,),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//
//         );
//       },
//
//
//           listener: (context,index){});
//     });
//
//   }
//   Widget buildMassage(MassageModel model)=>  Align(
//     alignment: AlignmentDirectional.centerStart,
//     child: Container(
//       decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadiusDirectional.only(
//             bottomEnd: Radius.circular(10),
//             topStart: Radius.circular(10),
//             topEnd: Radius.circular(10),
//           )
//       ),
//       padding: EdgeInsets.symmetric(
//         vertical: 5,
//         horizontal: 10,
//       ),
//       child: Text(model.messagetext),
//     ),
//   );
//   Widget buildmyMassage(MassageModel model)=>    Align(
//     alignment: AlignmentDirectional.centerEnd,
//     child: Container(
//       decoration: BoxDecoration(
//           color:Colors.blue.withOpacity(.2),
//           borderRadius: BorderRadiusDirectional.only(
//             bottomStart: Radius.circular(10),
//             topStart: Radius.circular(10),
//             topEnd: Radius.circular(10),
//           )
//       ),
//       padding: EdgeInsets.symmetric(
//         vertical: 5,
//         horizontal: 10,
//       ),
//       child: Text(model.messagetext),
//     ),
//   );
// }
