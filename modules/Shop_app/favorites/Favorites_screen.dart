import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/Shop_app/Cubit/states.dart';

import '../../../components/components.dart';
import '../../../layout/Shop_app/Cubit/cubit.dart';
import 'Get_Favorites_Model.dart';




class favoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayCubit, ShopStates>(builder: (context, state) {
      return ConditionalBuilder(
              condition:ShopLayCubit.get(context).getFavoritesModel !=null,
              builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),

                  itemBuilder: (context, index) =>
                      builderListProduct(ShopLayCubit.get(context).getFavoritesModel!.data.data[index].product,context),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: ShopLayCubit
                      .get(context)
                      .getFavoritesModel!
                      .data
                      .data
                      .length),
              fallback:(context) => Center(child: CircularProgressIndicator()));
      var Cubit = ShopLayCubit.get(context);

    }, listener: (context, state) {});
  }




  }
  // Widget  ( GetFavoritesModel model,context)=> Padding(
  //   padding: const EdgeInsets.all(20.0),
  //   child: Container(
  //     height: 120,
  //     child: Row(
  //
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //
  //       children: [
  //
  //         Stack(
  //           alignment: Alignment.bottomLeft,
  //           children: [
  //             Image(image: NetworkImage(model.product.image),
  //
  //               width: double.infinity,
  //               height: 200,
  //
  //             ),
  //             if(model.product.discount !=0)
  //               Container(
  //                 color: Colors.red,
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 5),
  //                   child: Text('DISCOUNT',
  //                     style: TextStyle(
  //                       fontSize: 8,
  //                       color: Colors.white,
  //                     ),
  //
  //                   ),
  //                 ),
  //               ),
  //           ],
  //         ),
  //
  //         SizedBox(height: 20,),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(model.product.name,
  //
  //                 maxLines: 2,
  //
  //                 overflow: TextOverflow.ellipsis,
  //
  //                 style: TextStyle(
  //                   height: 1.3,
  //                   fontSize: 12,
  //
  //
  //
  //                 ),
  //
  //
  //
  //               ),
  //               SizedBox(height: 5,),
  //               Row(
  //
  //                 children: [
  //
  //                   Text(model.product.price.toString(),
  //
  //                     style: TextStyle(
  //
  //                       fontSize: 12,
  //
  //                       color: Colors.blue,
  //
  //
  //
  //                     ),
  //
  //
  //
  //                   ),  SizedBox(width: 5,),
  //                   if(model.product.discount !=0)
  //                     Text(model.product.old_price.toString(),
  //
  //                       style: TextStyle(
  //
  //                         fontSize: 10,
  //
  //                         decoration: TextDecoration.lineThrough,
  //
  //                         color: Colors.grey,
  //
  //
  //
  //                       ),
  //
  //
  //
  //                     ),
  //                   Spacer(),
  //
  //
  //
  //
  //                   IconButton(
  //
  //                       padding: EdgeInsets.zero,
  //
  //
  //                       onPressed: (){
  //
  //                         print(model.id);
  //
  //                       }, icon: CircleAvatar(
  //                       radius: 15,
  //                       backgroundColor: ShopLayCubit.get(context).favorites![model.product.id] ??true&&false? Colors.blue:Colors.grey,
  //                       child: Icon(
  //
  //                         Icons.favorite_border,size: 14,
  //                         color: Colors.white,
  //                       ))),
  //
  //
  //
  //                 ],
  //
  //               ),
  //
  //             ],
  //           ),
  //         ),
  //
  //
  //       ],
  //
  //     ),
  //   ),
  // );


//     return BlocProvider.value(
//       value: ShopCubit.get(context)..getFavoritesData()..getUserData(),
//       child: BlocConsumer<ShopCubit,ShopStates>(
//         listener: (context , state) {},
//         builder: (context , state) {
//
//
//           return ConditionalBuilder(
//               condition: true,
//               builder: (context) => ProductsBuilder(ShopCubit.get(context).GetFavoritesModel! ,context ),
//               fallback:(context) => Center(child: CircularProgressIndicator()));
//         },
//       ),
//     );
//   }
//
//   Widget ProductsBuilder(getFavoritesModel model,context) => Container(
//     child: GridView.count(
//       shrinkWrap: true,
//       crossAxisSpacing: 1,
//       mainAxisSpacing: 1,
//       childAspectRatio: 1 / 1.35,
//       crossAxisCount: 2,
//       children:
//       List.generate(model.data.data.length, (index) =>
//           builderGridProduct(model.data.data[index], context,index),
//       ),
//     ),
//   );
//
//   Widget builderGridProduct(FavoritesData model , context,index)
//   {
//     ShopCubit Cubit = ShopCubit.get(context);
//     return Column(
//       children: [
//         Container(
//           color: Colors.white,
//           child:Image(
//             image:NetworkImage(model.product.image),
//             width: double.infinity,
//             height: 200,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsetsDirectional.only(top: 5, start: 5, end: 5,),
//           child: Text(
//             model.product.name,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 14.0,
//               height: 1.1,
//             ),
//           ),
//         ),
//         Stack(
//           alignment: AlignmentDirectional.centerEnd,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 8.0),
//               child: IconButton(onPressed: () {
//                 ShopCubit.get(context).changeFavorites(model.product.id);
//                 // ShopCubit.get(context).getFavoritesData();
//                 // showToast(
//                 //   text: ShopCubit
//                 //       .get(context)
//                 //       .ChangeFavorites!
//                 //       .message
//                 //       .toString(),
//                 //   state: ToastStates.SUCCESS,
//                 // );
//               },
//                 icon: Icon(Cubit.favorites[model.product.id] == true
//                     ? Cubit.FavIcon = Icons.favorite
//                     : Cubit.FavIcon = Icons.favorite_border, size: 18,
//                 ),
//               ),
//             ),
//             Container(
//               // decoration: BoxDecoration(
//               //   color: Colors.white,
//               //   borderRadius: BorderRadius.circular(3.0,),
//               // ),
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: Row(
//                   // mainAxisSize: MainAxisSize.min,
//                   // mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//
//                     Text(
//                       '${model.product.price.round()}',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 14.0,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5.0,
//                     ),
//                     Text(
//                       '${model.product.old_price.round()}',
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 10.0,
//                         decoration: TextDecoration.lineThrough,
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
