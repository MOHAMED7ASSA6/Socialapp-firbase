import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/components/components.dart';

import '../../../layout/Social_layout/cubit/cubit.dart';
import '../../../layout/Social_layout/cubit/stats.dart';
import '../Feeds/EDITPROFILE/Editprofile.dart';

class settingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(builder: (context,state){
      var usermodel = SocialCubit.get(context).UserModel;
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
          children: [

            Container(
                height: 190,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                            image: DecorationImage(
                              image: NetworkImage('${usermodel!.cover}',
                              ),
                              fit: BoxFit.cover,

                            )
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 57,
                        backgroundImage: NetworkImage('${usermodel.image}'),

                      ),
                    )
                  ],
                ),
              ),
            SizedBox(height: 5,),


            Text('${usermodel.name}',
              style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text('${usermodel.bio}',
              style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Text('100',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Text('post',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Text('1000',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Text('Followers',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Text('1000',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Text('Following',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Text('10',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Text('Videos',
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child:OutlinedButton(onPressed: () {},
                child: Text('Edit Profile'),)),
        SizedBox(width: 10,),
        OutlinedButton(onPressed: () {
          navigateTo(context, EditprofilScreen());
        }, child: Icon(Icons.edit,size: 16,)),

              ],
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: (){
                    FirebaseMessaging.instance.subscribeToTopic('Subscribe');
                  },
                  child: Text('Subscribe'),
                ),
SizedBox(width: 10,),
                OutlinedButton(
                  onPressed: (){
                    FirebaseMessaging.instance.subscribeToTopic('Unsubscribe');
                  },
                  child: Text('Unsubscribe'),
                )
              ],
            )

          ],
        ),
     );
    }, listener: (context,state){});
  }
}
