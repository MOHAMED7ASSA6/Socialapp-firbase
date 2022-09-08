// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
//
// class MessengerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         titleSpacing: 20.0,
//         title: Row(
//           children: [
//             CircleAvatar(
//               radius: 20.0,
//               backgroundImage: NetworkImage(
//                   'https://scontent.fcai20-1.fna.fbcdn.net/v/t31.18172-8/10980163_10153746859860476_4100533946823686083_o.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=OVaze3wD4pUAX8Kd4iq&_nc_ht=scontent.fcai20-1.fna&oh=e7aa44ff3d1cf51dc00c00f7adf6b82e&oe=60F3E879'),
//             ),
//             SizedBox(
//               width: 15.0,
//             ),
//             Text(
//               'Chats',
//               style: TextStyle(
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: CircleAvatar(
//               radius: 15.0,
//               backgroundColor: Colors.blue,
//               child: Icon(
//                 Icons.camera_alt,
//                 size: 16.0,
//                 color: Colors.white,
//               ),
//             ),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: CircleAvatar(
//               radius: 15.0,
//               backgroundColor: Colors.blue,
//               child: Icon(
//                 Icons.edit,
//                 size: 16.0,
//                 color: Colors.white,
//               ),
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                     5.0,
//                   ),
//                   color: Colors.grey[300],
//                 ),
//                 padding: EdgeInsets.all(3.0),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.search,
//                       size: 25.0,
//                       color: Colors.black38,
//                     ),
//                     SizedBox(
//                       width: 15.0,
//                     ),
//                     Text(
//                       'Search',
//                       style: TextStyle(
//                         fontSize: 17.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Container(
//                 height: 100.0,
//                 child: ListView.separated(
//                   //shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) => buildStoryItem(),
//                   separatorBuilder: ( context, index) => SizedBox(
//                     width: 20.0,
//                   ),
//                   itemCount: 10,
//                 ),
//               ),
//               ListView.separated(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: ( context , index ) => buildChatItem(),
//                 separatorBuilder: ( context , index ) => SizedBox(
//                   height: 20.0,
//                 ),
//                 itemCount: 20,
//
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildChatItem() => Row(
//     children: [
//       Stack(
//         alignment: AlignmentDirectional.bottomEnd,
//         children: [
//
//           CircleAvatar(
//             radius: 30.0,
//             backgroundImage: NetworkImage(
//                 'https://scontent.fcai20-1.fna.fbcdn.net/v/t31.18172-8/10980163_10153746859860476_4100533946823686083_o.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=OVaze3wD4pUAX8Kd4iq&_nc_ht=scontent.fcai20-1.fna&oh=e7aa44ff3d1cf51dc00c00f7adf6b82e&oe=60F3E879'),
//           ),
//           Padding(
//             padding: const EdgeInsetsDirectional.only(
//               bottom: 3.0,
//               end: 3.0,
//             ),
//             child: CircleAvatar(
//               backgroundColor: Colors.green,
//               radius: 10.0,
//             ),
//           ),
//         ],
//       ),
//       SizedBox(
//         width: 30.0,
//       ),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Nouradawy',
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Last message : this is the last message you recived form your client',
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 5.0,
//                   ),
//                   child: Container(
//                     height: 5.0,
//                     width: 5.0,
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       shape: BoxShape.circle,
//                     ),
//
//                   ),
//                 ),
//                 Text(
//                   '11:00 AM',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
//   Widget buildStoryItem() => Container(
//     width: 60.0,
//     child: Column(
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.bottomEnd,
//           children: [
//             CircleAvatar(
//               radius: 30.0,
//               backgroundImage: NetworkImage(
//                   'https://scontent.fcai20-1.fna.fbcdn.net/v/t31.18172-8/10980163_10153746859860476_4100533946823686083_o.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=OVaze3wD4pUAX8Kd4iq&_nc_ht=scontent.fcai20-1.fna&oh=e7aa44ff3d1cf51dc00c00f7adf6b82e&oe=60F3E879'),
//             ),
//             Padding(
//               padding: const EdgeInsetsDirectional.only(
//                 bottom: 3.0,
//                 end: 3.0,
//               ),
//               child: CircleAvatar(
//                 radius: 8.0,
//                 backgroundColor: Colors.green,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 5.0,
//         ),
//         Text(
//           'Nouradawy',
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ],
//     ),
//   );
//
//
// }