

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/Network/local/Cache_helper.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/modules/Shop_app/Login/ShopLoginScreen.dart';
class OnBoardingmodel{
final String image;
final String title;
final String body;
OnBoardingmodel( {
  required  this.image,
  required this.title,
  required this.body,
});
}
class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool islast=false;
List<OnBoardingmodel> board=[
  OnBoardingmodel(
      image: 'assets/images/father.png',
      body: 'On Board 1 body',
      title: 'On Board 1 title'

  ),
  OnBoardingmodel(
      image: 'assets/images/buyer.png',
      body: 'On Board 2 body',
      title: 'On Board 2 title'

  ),
  OnBoardingmodel(
      image: 'assets/images/istock.png',
      body: 'On Board 3 body',
      title: 'On Board 3 title'

  ),


];
void Submit(){
  cacheHelper.saveData(key: 'onboarding', value: true).then((value) {
    if(value){  navigateTorout(context, ShopLoginScrean());}
  });


}

var boardcontroller=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            Submit();
          }, child: Text('SKIP'))
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index==board.length-1){
                    setState((){
                      islast=true;
                    });
                  }else{
                    islast=false;
                  }




                },
                controller: boardcontroller,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildBording(board[index]),
              itemCount: board.length,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
               SmoothPageIndicator(controller: boardcontroller, count: board.length,
               effect: ExpandingDotsEffect(
                 expansionFactor: 4,
                 dotColor: Colors.grey,
                 dotHeight: 10,
                 dotWidth: 10,
                 spacing: 5,activeDotColor: Colors.blue,

               ),

               ),

                Spacer(),
                FloatingActionButton(onPressed: (){
                  if(islast){
                    Submit();

                  }else{   boardcontroller.nextPage(duration: Duration(
                    milliseconds: 720,
                  ), curve: Curves.fastLinearToSlowEaseIn);}


                },
                child: Icon(Icons.arrow_forward_ios ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
Widget buildBording(OnBoardingmodel model )=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(image:
        AssetImage('${model.image}'),
        ),
      ),
      SizedBox(height: 5,),
      Text('${model.title}',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),

      ),
      SizedBox(height: 10,),
      Text('${model.body}',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),

      ),
    ],
  );
