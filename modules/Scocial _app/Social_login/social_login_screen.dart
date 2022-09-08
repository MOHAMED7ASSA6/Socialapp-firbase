


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Network/local/Cache_helper.dart';
import 'package:untitled/modules/Scocial%20_app/Social_login/cubit/cubit.dart';


import '../../../components/components.dart';
import '../../../layout/Social_layout/social_layout.dart';
import '../SocialRegister/ShopRegisterScreen.dart';
import 'cubit/states.dart';

class SocialLoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SocialLoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
   return BlocProvider(
       create: (BuildContext context )=>SocialLoginCubit(),
     child: BlocConsumer<SocialLoginCubit,SocialLoginState>(
       listener: (context ,state){
         if(state is SocialLoginErrorState){
           showToast(text: state.error.toString(), state: ToastStates.ERROR);
         }
         if(state is SocialLoginSuccessState){
        cacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
          navigateTorout(context, SocialLayout());
        });
         }
       },
       builder: (context ,state){
         return  Scaffold(
           appBar: AppBar(),
           body: Center(
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Form(
                   key:formKey ,
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
                         'Login now to communicate with friends',
                         style: Theme.of(context).textTheme.bodyText1!.copyWith(
                           color:Colors.grey,
                         ),
                       ),
                       defaultFormField(  controller: emailController,
                         type: TextInputType.emailAddress,


                         validate: (  value){if(value.isEmpty) {
                           return 'please enter your email address';
                         }  return null;},

                         label: 'email',
                         prefix: Icons.email_outlined,
                       ), SizedBox(height: 15,),
                       defaultFormField(  controller: passwordController,
                         type: TextInputType.visiblePassword,

                         validate: (  value){if(value.isEmpty) {
                           return 'please enter your password address';
                         }  return null;},

                         onSubmitted: (value){
                           if(formKey.currentState!.validate())
                           {SocialLoginCubit.get(context).userLogin(email: emailController.text,
                               password: passwordController.text);}
                         },
                         isPassword:   SocialLoginCubit.get(context).isPassword,
                         suffixPass: (){
                           SocialLoginCubit.get(context).Passon();

                         },
                         label: 'password',
                         prefix: Icons.lock,
                         suffix:  SocialLoginCubit.get(context).sufix,
                       ),
                       SizedBox(height: 15,),
                       ConditionalBuilder(
                         condition: state is !SocialLoginLoadingState,
                         builder: (context)=>defaultButton(function: (){
                           if(formKey.currentState!.validate())
                           {SocialLoginCubit.get(context).userLogin(email: emailController.text,
                               password: passwordController.text);}


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
                             navigateTo(context,SocialRegisterScreen());
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
     ) ,


   
    );
  }
}