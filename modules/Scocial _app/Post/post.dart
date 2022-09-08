



import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import '../../../layout/Social_layout/cubit/cubit.dart';
import '../../../layout/Social_layout/cubit/stats.dart';
import '../../../styles/IconsBroken.dart';

class Postscreen extends StatelessWidget {

var textController=TextEditingController();
var imageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
  return BlocConsumer<SocialCubit,SocialState>(builder: (context,state){
    File? postImage = SocialCubit.get(context).PostImage as File?;
    return  Scaffold(
        appBar: AppBar(
          title:Text( 'Create Post'),
          actions: [
            defaultTextButton(
                onPressedFunction: () {
                  if(SocialCubit.get(context).PostImage ==null){
                    SocialCubit.get(context).CreatePost(
                      dateTime: DateTime.now().toLocal().toString(),
                      text: textController.text,
                    );
                  }else{
                    SocialCubit.get(context).uploadPostImage
                      (dateTime: DateTime.now().toLocal().toString(), text: textController.text,);
                  }

            },text: 'Post',)
          ],
        ),
        body: Padding(

          padding: const EdgeInsets.all(20.0),

          child:   Column(


            children: [
if(state is CreatePostLoadingstate)
LinearProgressIndicator(),
  if(state is CreatePostLoadingstate)
                SizedBox(height: 10,),
              Row(

                children: [

                  CircleAvatar(

                    radius: 25,

                    backgroundImage: NetworkImage('${SocialCubit.get(context).UserModel?.image}'),



                  ),

                  SizedBox(width: 15,),

                  Expanded(

                    child:   Text('${SocialCubit.get(context).UserModel!.name}',

                      style: TextStyle(

                          height: 1.4

                      )



                      ,),

                  ),

                ],

              ),
              Expanded(

                child:
                  TextFormField(
controller: textController,
                    decoration: InputDecoration(


                        hintText: 'what is on your mind.... ',

                      hintStyle: TextStyle(
                        overflow: TextOverflow.ellipsis,


                      ),

                      border: InputBorder.none,

                    ),
                  ),

              ),
              if(SocialCubit.get(context).PostImage !=null)
              Stack(
                alignment: Alignment.topRight,
                children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                            image:  FileImage( postImage! ),
                            fit: BoxFit.cover,

                          )
                      ),
                    ),

                  IconButton(
                 icon: CircleAvatar(
                      radius: 20,

                      child: Icon(Icons.close)),
                    onPressed: () {  SocialCubit.get(context).removePostImage(); },
                  )],
              ),
              SizedBox(height: 20,),
              Row(

                children: [
                  Expanded(
                    child: TextButton(onPressed: (){
                      SocialCubit.get(context).getPostImage();
                    }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(IconBroken.Image),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'add photo',
                        )
                      ],
                    )),
                  ),
                  Expanded(
                    child: TextButton(onPressed: (){}, child: Text(
                      '# tags',
                    )),
                  ),

                ],
              ),

            ],

          ),
        )
    );
  }, listener: (context,state){});
  }
}
