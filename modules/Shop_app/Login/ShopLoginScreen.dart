

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/components/constants.dart';
import 'package:untitled/modules/Shop_app/Login/cubit/states.dart';

import '../../../Network/local/Cache_helper.dart';
import '../../../components/components.dart';
import '../../../layout/Shop_app/ShopLayout.dart';
import '../Register/ShopRegisterScreen.dart';
import 'cubit/cubit.dart';

class ShopLoginScrean extends StatelessWidget {

var emailcontroller=TextEditingController();
var passwordcontroller=TextEditingController();
var formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginState>(
          listener: (context,state){
            if(state is ShopLoginSuccessState){
              if(state.loginModel.status??true){

                print(state.loginModel.message);
                print(state.loginModel.data!.token);
                cacheHelper.saveData(key: 'token', value: state.loginModel.data!.token).then((value) {
                   token=state.loginModel.data!.token;
                  navigateTorout(context, ShopLayout());
                });


              }else{
                print(state.loginModel.message.toString(),);
                showToast(

                    text: state.loginModel.message.toString(),
            state: ToastStates.ERROR,);

              }
            }
          },

          builder:  (context,state){
           return Scaffold(
              appBar: AppBar(),
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
                            'LOGIN',
                            style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Login now to brows our hot offers',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color:Colors.grey,
                            ),
                          ),
                          defaultFormField(  controller: emailcontroller,
                            type: TextInputType.emailAddress,


                            validate: (  value){if(value.isEmpty) {
                              return 'please enter your email address';
                            }  return null;},

                            label: 'email',
                            prefix: Icons.email_outlined,
                          ), SizedBox(height: 15,),
                          defaultFormField(  controller: passwordcontroller,
                            type: TextInputType.visiblePassword,

                            validate: (  value){if(value.isEmpty) {
                              return 'please enter your password address';
                            }  return null;},

                          onSubmitted: (value){
                            if(formkey.currentState!.validate())
                            {ShopLoginCubit.get(context).userLogin(email: emailcontroller.text,
                                password: passwordcontroller.text);}
                          },
                            isPassword:   ShopLoginCubit.get(context).isPassword,
                            suffixPass: (){
                            ShopLoginCubit.get(context).Passon();

                            },
                            label: 'password',
                            prefix: Icons.lock,
                            suffix:  ShopLoginCubit.get(context).sufix,
                          ),
                          SizedBox(height: 15,),
                          ConditionalBuilder(
                            condition: state is !ShopLoginLoadingState,
                            builder: (context)=>defaultButton(function: (){
                           if(formkey.currentState!.validate())
                           {ShopLoginCubit.get(context).userLogin(email: emailcontroller.text,
                               password: passwordcontroller.text);}


                            }, text: 'LOGIN'),
                       fallback: (context)=>Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Text(
                                  'Don\'t have an account'
                              ),
                              SizedBox(width: 5,),

                              TextButton(onPressed: (){
                                navigateTo(context,RegisterScreen());
                              }, child: Text('Register'))

                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
    );


  }
}
