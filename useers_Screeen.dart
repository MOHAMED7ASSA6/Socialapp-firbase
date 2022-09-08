// import 'package:flutter/material.dart';
//
// class UserModel {
//   final int id;
//   final String name;
//   final String phone;
//
//   UserModel({
//     @required this.id=1,
//     @required this.name='n',
//     @required this.phone='n',
//   });
// }
// class  UsersScreen extends StatelessWidget {
//   List<UserModel> users = [
//     UserModel(
//         id: 1,
//         name: 'Nouradawy',
//         phone: '+201020007093'
//
//     ),
//     UserModel(
//         id: 2,
//         name: 'Heba elsaid ahmed elbaz',
//         phone: '+20102009321'
//
//     ),
//     UserModel(
//         id: 3,
//         name: 'Mohamed yahia Mohamed el adawy',
//         phone: '+201220574093'
//
//     ),
//     UserModel(
//       id: 4,
//       name: 'King 3absalam m3\'ary',
//       phone: '+201023345093',
//
//     ),
//     UserModel(
//         id: 5,
//         name: 'Ayman bolaka Discord',
//         phone: '+201230047593'
//
//     ),
//     UserModel(
//         id: 6,
//         name: 'Sharpshark shamal ganob',
//         phone: '+201025677095'
//
//     ),
//     UserModel(
//         id: 7,
//         name: 'Mo3taz A.F.K ',
//         phone: '+2010456546567'
//
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//         Text('Users data base'),
//         //actions: [],
//         //leading: ,
//       ),
//       body: ListView.separated(
//         itemBuilder: ( context , index ) => buildUserItem(users[index]),
//         separatorBuilder: ( context , index ) => Container(
//           width: double.infinity,
//           height: 1.0,
//           color: Colors.grey[400],
//         ),
//         itemCount: users.length,
//       ),
//     );
//   }
//
//   Widget buildUserItem(UserModel user) => Row(
//     children:
//     [
//       Padding(
//         padding: const EdgeInsets.all(
//           20.0,
//         ),
//         child: CircleAvatar(
//           radius: 25.0,
//           child: Text(
//             '${user.id}',
//             style: TextStyle(
//               fontSize: 25.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//       SizedBox(width: 5.0,),
//       Expanded(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '${user.name}',
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//               style: TextStyle(
//                 fontSize: 25.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               '${user.phone}',
//               style: TextStyle(
//                 color: Colors.grey,
//                 //fontSize: 20.0,
//                 //fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }