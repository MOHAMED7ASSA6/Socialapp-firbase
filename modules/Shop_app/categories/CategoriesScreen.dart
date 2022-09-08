


// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:untitled/components/components.dart';

import '../../../layout/Shop_app/Cubit/cubit.dart';
import '../../../layout/Shop_app/Cubit/states.dart';
import 'categoriesModule.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayCubit,ShopStates>(builder: (context,state){
      var Cubit=ShopLayCubit.get(context);
      return ScreenTypeLayout(mobile: Builder(
        builder: (context) {
          Cubit.isdesktop(false);
          return ConditionalBuilder(
            condition:  Cubit.categoriesModel !=null,
            builder:(context)=> ListView.separated(
                physics: BouncingScrollPhysics(),


                itemBuilder: (context,index)=>buildCategoris(Cubit.categoriesModel!.data.data[index],index,context),
                separatorBuilder: (context,index)=>myDivider() ,
                itemCount: Cubit.categoriesModel!.data.data.length),
            fallback: (context)=> Center(child: CircularProgressIndicator()),
          );
        }
      ),
      desktop:Builder(
        builder: (context) {
          Cubit.isdesktop(true);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Expanded(
              child: ConditionalBuilder(
                condition:  Cubit.categoriesModel !=null,
                builder:(context)=> ListView.separated(
                    physics: BouncingScrollPhysics(),


                    itemBuilder: (context,index)=>buildCategoris(Cubit.categoriesModel!.data.data[index],index,context),
                    separatorBuilder: (context,index)=>myDivider() ,
                    itemCount: Cubit.categoriesModel!.data.data.length),
                fallback: (context)=> Center(child: CircularProgressIndicator()),
              ),
          ),
          Expanded(
          child: Container(
            child: Text('dsd'),

          ),
          )

          ],


          );
        }
      ),
      breakpoints: ScreenBreakpoints(
      desktop: 600,
      watch: 350, tablet: 350,

      ),

      );


    }, listener: (context,state){});
  }}
Widget buildCategoris(CategoriesDataModel model,index,context)=>   Container(
   color: ShopLayCubit.get(context).getCategories[index]&&  ShopLayCubit.get(context).isDesktop?Colors.grey[200]:Colors.white,
  child:   InkWell(

    onTap: (){

     ShopLayCubit.get(context).select(index);

    },

    child:   Expanded(



      child:   Padding(



        padding: const EdgeInsets.all(20.0),



        child:   Row(







          children: [







            Image(image: NetworkImage(model.image),







              width: 80,







              height: 80,







              fit: BoxFit.cover,







            ),







            SizedBox(width: 20,),







            Text(model.name



    ,maxLines: 1,



              overflow: TextOverflow.ellipsis



              ,style: TextStyle(







                fontSize: 20,







                fontWeight: FontWeight.bold,















              ),







            ),







            SizedBox(width: 20,),







            Spacer(),







            Icon(Icons.arrow_forward_ios)







          ],







        ),



      ),



    ),

  ),
);