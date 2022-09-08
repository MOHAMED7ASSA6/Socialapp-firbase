





import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/components.dart';
import '../../../layout/Social_layout/cubit/cubit.dart';
import '../../../layout/Social_layout/cubit/stats.dart';
import '../SocialRegister/Social_model/social_model.dart';
import 'chat/chat.dart';
import 'chat/chatscreen.dart';



class ChatsScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SocialCubit,SocialState>(
        listener:(context,state){} ,
        builder: (context,state){
          return    ListView.separated(itemBuilder: (context,index)=> buildChats(SocialCubit.get(context).users[index],context),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount: SocialCubit.get(context).users.length,
          );
        });


  }
  Widget buildChats(SocialDataModel model,context)=>

      InkWell(
        onTap: (){
 navigateTo(context, ChatDetailsScreen(
   UserModel: model,
 ));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(model.image),

              ),
              SizedBox(width: 15,),
              Text(model.name,
                style: TextStyle(
                    height: 1.4
                )

                ,),





            ],

        ),

  ),
      );
}
