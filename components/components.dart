import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/styles/IconsBroken.dart';



import '../layout/Shop_app/Cubit/cubit.dart';
import '../layout/Todo_app/Cubit/cubit.dart';
import '../modules/News_app/SettingsScreen/WebViewScreen.dart';
AppBar defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    titleSpacing: 0.0,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(IconBroken.Arrow___Left_2),
    ),
    title: Text(title != null ? title : ''),
    actions: actions != null ? actions : [],
  );
}
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function() function,
  required String text,
  bool isUpperCase = true,
  double radius = 3.0,
}) =>
    Container(
      width: width,
      height: 40,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
    );






// Widget defaultTextForm(
//    context, {
//       required TextEditingController controller,
//       required TextInputType keyBoardType,
//
//     Function? onTap,
//       required Function? validate,
//      Function? onChange,
//       Function ?onSubmit,
//       bool IsPassword = false,
//       IconData? preIcon,
//  IconData? Suffix,
//       // bool ObsText = false
//
//
//     }) =>
//   // final bool isactive = IsPassword;
//   // isactive?IsPassword = Cubit.isPassword: null;
//
//  TextFormField(
//     controller: controller,
//
//     obscureText: IsPassword,
//     keyboardType: keyBoardType,
//     onFieldSubmitted:onSubmit!() ,
//    validator:validate!(),
//
//     onTap: onTap!(),
//     onChanged: onChange!(),
//
//     decoration: InputDecoration(
//
//
//       prefixIcon: Icon(
//         preIcon,
//       ),
//       suffixIcon: Icon(
//           Suffix,
//       ),
//       border: OutlineInputBorder(),
//     ),
//   );
Widget defaultFormField({

  required TextEditingController controller,
  required TextInputType type,
  Function? suffixPass,
  required Function validate,
  Function ?onSubmitted,
  String  ?hintText,
  required String  label,
  IconData ?prefix,
  bool isPassword =false,
  IconData? suffix,

})=>TextFormField(

    onFieldSubmitted:(value)=>onSubmitted!(value),

    onChanged: (valwe){
      print(valwe);
    },
    validator: (valu)=>validate(valu),


    controller:controller ,
    obscureText: isPassword,
    keyboardType:type,

    decoration: InputDecoration(
      suffixIcon:suffix !=null? IconButton(
          onPressed:(){
            suffixPass!();
          },
          icon: Icon(suffix,)) :null,
      hintText:  hintText,
      label: Text(label),
      // labelText: '',
      prefixIcon: Icon(prefix),
      border: OutlineInputBorder()  ,
    ));

Widget buildTaskItem(
    Map model,
    context,
    ) =>
    Dismissible(
      key: Key(model['id'].toString()),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              radius: 38.0,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 36.0,
                backgroundColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    '${model['time']}',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${model['title']}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon: Icon(Icons.check_box)),
          IconButton(
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'archive',
                  id: model['id'],
                );
              },
              icon: Icon(Icons.archive)),
          // IconButton(onPressed: ()
          // {
          //   AppCubit.get(context).DeleteFromData(id:model['id']);
          // }, icon: Icon(Icons.delete_forever_outlined)),
        ],
      ),
      onDismissed: (direction) {
        AppCubit.get(context).DeleteFromData(id: model['id']);
      },
    );



Widget buildArticleItem(article, context) {
  return InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen(url: article['url'],));
    },
    child: Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                      "${article['urlToImage']}",
                    ),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${article["title"]}",
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${article["publishedAt"]}",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget myDivider() {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Divider(
      color: Colors.grey,
      thickness: 1,
    ),
  );
}

void navigateTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));


void showToast({
  required String text,
  required ToastStates state,})=>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0
    );

enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}
TextButton defaultTextButton({
required Function onPressedFunction,
required String text, required ,
}) {
return TextButton(
onPressed: onPressedFunction as VoidCallback,
child: Text(
text.toUpperCase(),
),
);
}
// void navigateTo(context,Widget)=>Navigator.push(context, MaterialPageRoute(
//     builder: (context)=>Widget));
void navigateTorout(context,Widget)=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context)=>Widget

),
        (rout){return false;}
);
Widget builderListProduct( model , context,{
  bool isoldprice=true,
})=>

    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          height: 120,
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Container(
                height: 120,
                width: 120,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image(image: NetworkImage(model.image),

                      width: 120,
                      height: 120,

                    ),
                    if(model.discount !=0&&isoldprice)
                      Container(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text('DISCOUNT',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.white,
                            ),

                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.name,

                      maxLines: 2,

                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        height: 1.3,
                        fontSize: 12,



                      ),
                    ),
                    Spacer(),
                    Row(

                      children: [

                        Text(model.price.toString(),

                          style: TextStyle(

                            fontSize: 12,

                            color: Colors.blue,



                          ),



                        ),  SizedBox(width: 5,),
                        if(model.discount !=0&&isoldprice)
                          Text(model.old_price.toString(),

                            style: TextStyle(

                              fontSize: 10,

                              decoration: TextDecoration.lineThrough,

                              color: Colors.grey,



                            ),



                          ),
                        Spacer(),




                        IconButton(

                            padding: EdgeInsets.zero,


                            onPressed: (){
                              ShopLayCubit.get(context).Changefavories(model.id);
                              print(model.id);

                            }, icon: CircleAvatar(
                            radius: 15,
                            backgroundColor: ShopLayCubit.get(context).favorites[model.id] ??true&&false? Colors.blue:Colors.grey,
                            child: Icon(

                              Icons.favorite_border,size: 14,
                              color: Colors.white,
                            ))),



                      ],

                    ),

                  ],
                ),
              ),


            ],

          )


      ),
    );

