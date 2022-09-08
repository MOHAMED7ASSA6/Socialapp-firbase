





import 'package:untitled/modules/Shop_app/Login/loginmodel.dart';

abstract class ShopRegisteState{}

class ShopRegisteInitialState extends ShopRegisteState{}

class ShopRegisteLoadingState extends ShopRegisteState{}

class ShopRegisteSuccessState extends ShopRegisteState{

 final ShopLoginModel loginModel;

  ShopRegisteSuccessState(this.loginModel);



}

class ShopRegisteErrorState extends ShopRegisteState
{
final String error;
ShopRegisteErrorState(this.error);
}

class ShopRegisteIsPasswordState extends ShopRegisteState{}