import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import '../../../components/constants.dart';
import '../../../layout/Shop_app/Cubit/cubit.dart';
import '../../../layout/Shop_app/Cubit/states.dart';


class SettingsScreen extends StatelessWidget {
  var nameController= TextEditingController();
  var emailController= TextEditingController();
  var phoneController= TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopLayCubit,ShopStates>(
      builder: (context,state){



       return ConditionalBuilder(

           condition:ShopLayCubit.get(context).shopLoginModel != null,
           builder: (context)=>
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Form(
                   key: formkey,
                   child: Column(

                     children: [
                       if( state is ShopLoadingUpdateaState)
                         LinearProgressIndicator(),
                       defaultFormField(controller: nameController,
                         type: TextInputType.name,
                         validate: (  value){if(value.isEmpty) {
                           return 'please enter your name ';
                         }  return null;},

                         label: 'Name',
                         prefix: Icons.person,
                       ),
                       SizedBox(height: 20,),
                       defaultFormField(controller: emailController,
                         type: TextInputType.emailAddress,
                         validate: (  value){if(value.isEmpty) {
                           return 'please enter your email address ';
                         }  return null;},

                         label: 'Email',
                         prefix: Icons.email_outlined,
                       ),
                       SizedBox(height: 20,),
                       defaultFormField(
                         controller: phoneController,
                         type: TextInputType.phone,
                         validate: (  value){if(value.isEmpty) {
                           return 'please enter your  phone ';
                         }  return null;},

                         label: 'phone',
                         prefix: Icons.phone,
                       ),

                       SizedBox(height: 20,),
                       defaultButton(
                           function: (){
                             if(formkey.currentState!.validate()){
                               ShopLayCubit.get(context).updateUserData(
                                 email: emailController.text,
                                 phone: phoneController.text,
                                 name: nameController.text,
                               );
                             }

                           }, text: 'UPdate'),
                       SizedBox(height: 20,),
                       defaultButton(function: (){
                         SignOut(context);
                       }, text: 'LOGOUT'),

                     ],
                   ),
                 ),
               ),
           fallback: (context)=>Center(child: CircularProgressIndicator()));






      },
      listener: (context,state){

        var model= ShopLayCubit.get(context).shopLoginModel;

        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;

      },


    );


  }
}