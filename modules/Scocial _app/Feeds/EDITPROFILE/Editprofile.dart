







import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/components.dart';
import '../../../../layout/Social_layout/cubit/cubit.dart';
import '../../../../layout/Social_layout/cubit/stats.dart';
import '../../../../styles/IconsBroken.dart';

class EditprofilScreen extends StatelessWidget {

var Namecontroller=TextEditingController();
var boiecontroller=TextEditingController();
var phoneController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener:(context,state){} ,
      builder: (context,state){
        var usermodel=SocialCubit.get(context).UserModel;
        var ProfileImage=SocialCubit.get(context).profileImage;
        var CoverImage=SocialCubit.get(context).coverImage;
        Namecontroller.text = usermodel!.name!;
        boiecontroller.text = usermodel.bio!;
        phoneController.text = usermodel.phone!;
         File? profileImage = SocialCubit.get(context).profileImage;
     File? coverImage = SocialCubit.get(context).coverImage;
        return Scaffold(
          appBar: defaultAppBar(
            context:context ,
            title: 'Edit Profil',
            actions: [
              defaultTextButton(onPressedFunction: (){
                 SocialCubit.get(context).updateuser(
                   name: Namecontroller.text,
                   phone: phoneController.text,
                   bio: boiecontroller.text,
                 );
              }, text: 'Update'),
              SizedBox(width: 16,),

            ],


          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if(state is SocialuserdateupdateCoverImage)
                LinearProgressIndicator(),
                if(state is SocialuserdateupdateCoverImage)
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 190,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [

                          Align(
                            child:
                            Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: CoverImage == null
                                        ? NetworkImage(
                                      '${usermodel.cover}',
                                    )
                                        : FileImage(CoverImage)
                                    as ImageProvider<Object>,

                                    fit: BoxFit.cover,

                                  )
                              ),
                            ),
                            alignment: Alignment.topCenter,
                          ),
                          IconButton(
                            icon: CircleAvatar(
                                radius: 20,

                                child: Icon(IconBroken.Camera)),
                            onPressed: () {  SocialCubit.get(context).getCoverImage(); },
                          )
                        ],
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 57,
                              backgroundImage: ProfileImage == null
                                  ? NetworkImage(
                                '${usermodel.image}',
                              )
                                  : FileImage(ProfileImage)
                              as ImageProvider<Object>?,
                            ),
                          ),
                          CircleAvatar(
                              radius: 20,
                              child: IconButton(onPressed: (){
                                SocialCubit.get(context).getProfileImage();

                              }, icon: Icon(IconBroken.Camera))),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
           if(SocialCubit.get(context).profileImage !=null||SocialCubit.get(context).coverImage !=null)
                Row(
                  children: [
                    if(SocialCubit.get(context).profileImage !=null)
                    Expanded(
                      child:
                        Column(
                          children: [
                            defaultButton(function: (){
                              SocialCubit.get(context).uploadprofileImage(name: Namecontroller.text, phone: phoneController.text,
                                  bio:  boiecontroller.text,);
                            }, text: 'updateImage',),
                            if(state is SocialuserdateupdateCoverImage)
                            SizedBox(height: 5,),
                            if(state is SocialuserdateupdateCoverImage)
                            LinearProgressIndicator(),
                          ],
                        ),

                    ),

                    SizedBox(width: 5,),
                    if(SocialCubit.get(context).coverImage !=null)
                    Expanded(
                      child:
                      Column(
                        children: [
                          defaultButton(function: (){
                            SocialCubit.get(context).uploadcoverImage(name: Namecontroller.text, phone: phoneController.text,bio:  boiecontroller.text,);

                          }, text: 'updateCover',),
                          if(state is SocialuserdateupdateCoverImage)
                          SizedBox(height: 5,),
                          if(state is SocialuserdateupdateCoverImage)
                          LinearProgressIndicator(),
                        ],
                      ),

                    ),

                  ],
                ),
            if(SocialCubit.get(context).profileImage !=null||SocialCubit.get(context).coverImage !=null)
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: defaultFormField(

                        controller: Namecontroller,
                        type: TextInputType.name,
                        validate: (  value){if(value.isEmpty) {
                         return 'name must notbe empty';
          }  return null;},
                        label: 'Name',
                      prefix: IconBroken.User,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: defaultFormField(
                      controller: boiecontroller,
                      type: TextInputType.text,
                      validate: (  value){if(value.isEmpty) {
                        return 'bio must notbe empty';
                      }  return null;},
                      label: 'bio',
                      prefix: IconBroken.Info_Circle,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: defaultFormField(
                      controller: phoneController,
                      type: TextInputType.number,
                      validate: (  value){if(value.isEmpty) {
                        return 'phone must notbe empty';
                      }  return null;},
                      label: 'phone',
                      prefix: IconBroken.Call,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
