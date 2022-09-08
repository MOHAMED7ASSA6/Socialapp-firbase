
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:untitled/components/components.dart';

import '../../../layout/Shop_app/Cubit/cubit.dart';
import '../../../layout/Shop_app/Cubit/states.dart';
import '../categories/categoriesModule.dart';
import 'ShopProductsModule.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopLayCubit,ShopStates>(
        builder: (context,state){

          return ScreenTypeLayout(mobile:  ConditionalBuilder(
            condition:ShopLayCubit.get(context).homeModel !=null ,
            builder: (context)=>ProductBuild(ShopLayCubit.get(context).homeModel!,ShopLayCubit.get(context).categoriesModel!,context),
            fallback:(context)=>Center(child: CircularProgressIndicator()) ,
          ),
          desktop:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ConditionalBuilder(
                  condition:ShopLayCubit.get(context).homeModel !=null ,
                  builder: (context)=>ProductBuild(ShopLayCubit.get(context).homeModel!,ShopLayCubit.get(context).categoriesModel!,context),
                  fallback:(context)=>Center(child: CircularProgressIndicator()) ,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              )
              
            ],
            
          
          ),
            breakpoints: ScreenBreakpoints(
              desktop: 600,
              watch: 350, tablet: 350,

            ),
          );
        }, listener:  (context,state){
          if(state is ShopSuccessChangeFavorietsState){
            if(state.model.status==false){
              showToast(text: state.model.message.toString(), state: ToastStates.ERROR);
            }
          }
    },);
  }
Widget ProductBuild(HomeModel model ,CategoriesModel categoriesmodel,context)=>SingleChildScrollView(
  physics: BouncingScrollPhysics(),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    CarouselSlider(
          items:model.data!.banners.map((e) => Image(image: NetworkImage('${e.image}',),
            width: double.infinity,
           fit: BoxFit.cover,)
          ).toList(),
          options: CarouselOptions(
            initialPage: 0,
            enableInfiniteScroll: true,
            viewportFraction: 1.0,
            reverse:false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            scrollDirection: Axis.horizontal,

          ),
      ),
    SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories',
              style: TextStyle(
                fontSize: 24,

                fontWeight: FontWeight.w600,
              ),

            ),
     Container(
       height: 100,
       child: ListView.separated(
         physics: BouncingScrollPhysics(),
         scrollDirection: Axis.horizontal,
         itemBuilder:(context,index)=> BulidCategoryItem(categoriesmodel.data.data[index]),

                separatorBuilder: (context,index)=>SizedBox(width: 10,),
                itemCount:categoriesmodel.data.data.length,
    ),
     ),
            Text('New Products',
              style: TextStyle(
                fontSize: 24,

                fontWeight: FontWeight.w600,
              ),

            ),
          ],
        ),
      ),
      Container(
        color: Colors.grey[300],
        child: GridView.count(
            shrinkWrap: true,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 1/1.77,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
        children:List.generate( model.data!.products.length  , (index) => BuildGridProduct(model.data!.products[index],context))





        ),
      )
    ],
  ),
);
Widget BulidCategoryItem(CategoriesDataModel model)=>  Stack(
  alignment: Alignment.bottomCenter,
  children: [
    Image(image:
    NetworkImage(model.image,

    ),width: 100,
      height: 100,
      fit: BoxFit.cover,),
    Container(
      color: Colors.black.withOpacity(.6),
      width: 100,
      child: Text(model.name,

        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(

          color: Colors.white,
        ),
      ),
    ),
  ],
);
Widget BuildGridProduct(ProductModel model,context)=>Container(
  color: Colors.white,
  child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image(image: NetworkImage('${model.image}'),

          width: double.infinity,
          height: 200,

          ),
          if(model.discount !=0)
          Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text('DISCOUNT',
              style: TextStyle(
                fontSize: 8,
                color: Colors.white,
              ),

              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.name,

            maxLines: 2,

              overflow: TextOverflow.ellipsis,

              style: TextStyle(
             height: 1.3,
                fontSize: 12,
              ),
      ),
            SizedBox(height: 5,),
            Row(

              children: [

                Text('${model.price.round()}',

                  style: TextStyle(

                      fontSize: 12,

                    color: Colors.blue,



                  ),



                ),  SizedBox(width: 5,),
        if(model.discount !=0)
                Text('${model.oldPrice.round()}',

                  style: TextStyle(

                    fontSize: 10,

                    decoration: TextDecoration.lineThrough,

                    color: Colors.grey,



                  ),



                ),
                Spacer(),




                    IconButton(

                        padding: EdgeInsets.zero,


                        onPressed: (){
                          ShopLayCubit.get(context).Changefavories(model.id);
                          print(model.id);

                        }, icon: CircleAvatar(
                        radius: 15,
                        backgroundColor: ShopLayCubit.get(context).favorites[model.id] ??true&&false? Colors.blue:Colors.grey,
                        child: Icon(

                          Icons.favorite_border,size: 14,
                        color: Colors.white,
                        ))),



              ],

            ),

          ],
        ),
      ),

    ],

  ),
);

}