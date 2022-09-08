import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../layout/Social_layout/cubit/cubit.dart';
import '../../../layout/Social_layout/cubit/stats.dart';
import '../../../styles/IconsBroken.dart';
import '../Post/Postmudels/postmodels.dart';

class FeedScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SocialCubit,SocialState>(
        listener:(context,state){} ,
    builder: (context,state){
          return ConditionalBuilder(
              condition:SocialCubit.get(context).post.length>0
                 ,
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(

                    children: [

                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        margin: EdgeInsets.all(10.0),
                        elevation: 20.0,

                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Image(
                              image: NetworkImage('https://as1.ftcdn.net/v2/jpg/03/27/20/58/1000_F_327205838_a6eYhbxj9ELvoQHne9yLi5LqDPafPKhq.jpg'),
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('communicate with friends',
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: Colors.white,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>buildpostItme(SocialCubit.get(context).post[index],context,index),
                        separatorBuilder: (context,index)=>SizedBox(
                          height: 10,
                        ),
                        itemCount: SocialCubit.get(context).post.length,
                      )

                    ],
                  ),
                );
              } ,
              fallback:(context) => Center(child: CircularProgressIndicator()));
    });
  }
}
Widget buildpostItme(PostModel model, context,index)=>Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: EdgeInsets.all(10.0),
    elevation: 20.0,

    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('${model.image}'),

              ),
              SizedBox(width: 15,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${model.name}',
                          style: TextStyle(
                              height: 1.4
                          )

                          ,),
                        SizedBox(width: 5,),
                        Icon((Icons.check_circle),
                          size: 16,
                          color: Colors.blue,
                        )
                      ],
                    ),
                    Text('${model.dateTime}',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize:12
                      )

                      ,),
                  ],
                ),
              ),
              SizedBox(width: 15,),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz,
                size: 16,
              ),

              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Container(
              height: 1.0,
              color: Colors.grey[300],
              width: double.infinity,
            ),
          ),
          Text('${model.text}',
            style: Theme.of(context).textTheme.subtitle1,

          ),

          if(model.PostImage !='')
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(

                  image: NetworkImage('${model.PostImage}',

                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            size: 16,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            '${SocialCubit.get(context).likes[index]}'
                            ,style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black
                          ),
                          )
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            IconBroken.Chat,
                            size: 16,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            '${SocialCubit.get(context).comments[index]}'
                            ,style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black
                          ),
                          )
                        ],
                      ),
                    ),
                    onTap: (){

                    },
                  ),
                ),

              ],
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.grey[300],
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(

              children: [
                Expanded(
                  child: InkWell(

                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage('${SocialCubit.get(context).UserModel!.image}'),
                        ),
                        SizedBox(width: 15,),

                        Text('writ a comment....',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black,
                            height: 1.4,

                          )

                          ,),
                      ],
                    ),
                    onTap: (){
                      SocialCubit.get(context).getcomments( SocialCubit.get(context).commentId[index]);
                    },
                  ),
                ),



                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,),
                    child: Row(

                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 16,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          'Like'
                          ,style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.black
                        ),
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    SocialCubit.get(context).getLikespost( SocialCubit.get(context).PostId[index]);
                  },
                ),





              ],
            ),
          ),
        ],
      ),
    )
);



