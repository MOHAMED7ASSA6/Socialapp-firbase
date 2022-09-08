import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Network/local/Cache_helper.dart';
import '../../../components/components.dart';
import '../../../components/constants.dart';
import '../../../layout/Shop_app/Cubit/cubit.dart';
import '../../../layout/Shop_app/Cubit/states.dart';
import '../../../layout/Shop_app/ShopLayout.dart';

import '../../../layout/Social_layout/social_layout.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class SocialRegisterScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {


//    String? Textout;
    return BlocProvider(
      create: (BuildContext context)=>SocialRegisteCubit(),
      child: BlocConsumer<SocialRegisteCubit,SocialRegisteState>(
              builder: (context , state)=>Scaffold(
                appBar:  AppBar(
                  title: Text('Account Register'),
                ),
                body: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key:formkey ,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Register',
                                style: Theme.of(context).textTheme.headline4?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Register now to communicate with friends',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color:Colors.grey,
                                ),
                              ),
                              SizedBox(height: 15,),
                              defaultFormField(  controller: namecontroller,
                                type: TextInputType.name,


                                validate: (  value){if(value.isEmpty) {
                                  return 'please enter your name';
                                }  return null;},

                                label: 'User name',
                                prefix: Icons.person,
                              ), SizedBox(height: 15,),
                              defaultFormField(  controller: emailcontroller,
                                type: TextInputType.emailAddress,


                                validate: (  value){if(value.isEmpty) {
                                  return 'please enter your email address';
                                }  return null;},

                                label: 'email address',
                                prefix: Icons.email,
                              ),SizedBox(height: 15,),

                              defaultFormField(  controller: phonecontroller,
                                type: TextInputType.phone,


                                validate: (  value){if(value.isEmpty) {
                                  return 'please enter your phone';
                                }  return null;},

                                label: 'phone',
                                prefix: Icons.phone,
                              ),
                              SizedBox(height: 15,),

                              defaultFormField(  controller: passwordcontroller,
                                type: TextInputType.visiblePassword,

                                validate: (  value){if(value.isEmpty) {
                                  return 'please enter your password address';
                                }  return null;},

                                onSubmitted: (value){
                             },
                                isPassword:   SocialRegisteCubit.get(context).isPassword,
                                suffixPass: (){
                                  SocialRegisteCubit.get(context).PassonRegiste();

                                },
                                label: 'password',
                                prefix: Icons.lock,
                                suffix:  SocialRegisteCubit.get(context).sufix,
                              ),

                              SizedBox(height: 15,),
                              ConditionalBuilder(
                                condition: state is! SocialRegisteLoadingState,
                                builder: (context)=>
                                    defaultButton(function: (){
                                      if(formkey.currentState!.validate())
                                      {SocialRegisteCubit.get(context).userRegiste(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text,
                                          phone: phonecontroller.text,
                                          name: namecontroller.text);}


                                    }, text: 'Register'),
                                fallback: (context)=>Center(child: CircularProgressIndicator()),
                              ),




                            ],
                          ),
                        ),
                      ),
                    )),),

            listener: (context, state) {
              if(state is SocialCreatSuccessState){
                navigateTorout(context, SocialLayout());

              }
            },


      ),
    );
  }
}