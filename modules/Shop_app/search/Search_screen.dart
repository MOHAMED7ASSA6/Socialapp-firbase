

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import 'Cubit/cubit.dart';
import 'Cubit/states.dart';

class SearchScreen extends StatelessWidget {
var Searchcontroller=TextEditingController();
var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>ShopCubitSearch(),
      child: BlocConsumer<ShopCubitSearch,ShopSearchStates>(
        builder: (context,state)=>
            Scaffold(
              appBar: AppBar(),
              body: Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 50,
                        child: defaultFormField(controller: Searchcontroller,
                            type: TextInputType.text,

                            validate: (  value){if(value.isEmpty) {
                              return ' enter text to search';
                            }  return null;},
                            label: 'Search',
                          prefix: Icons.search,
                            onSubmitted: (value){
                              if(formkey.currentState!.validate())
                              {
                                ShopCubitSearch.get(context).Searchmodel(Searchcontroller.text);
                              }
                            }
                        ),),),
                          SizedBox(
                            height: 2,
                          ),
                       if(state is ShopLoadingSearchState)
                        LinearProgressIndicator(),
                    SizedBox(
                      height: 5,
                    ),
                    if(state is ShopSuccessSearchState)
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => builderListProduct(ShopCubitSearch.get(context).searchModel!.data!.data[index], context,isoldprice:false),
                            separatorBuilder: (context, index) => myDivider(),
                            itemCount: ShopCubitSearch.get(context).searchModel!.data!.data.length),
                    ),
                  ],

        ),
              ),
            ),
        listener: (context,state){},
      ),

    );
  }
}