

import '../../../modules/Shop_app/Login/loginmodel.dart';
import '../../../modules/Shop_app/favorites/Change_Favorites_Model.dart';


abstract class ShopStates {}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}


class ShopLoadingCategoriesDataState extends ShopStates{}
class ShopLoadingPostRegisterDataState extends ShopStates{}
class selectState extends ShopStates{}
class IsDesktopselectState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{
}
class ShopSuccessCategoriesState extends ShopStates{
}
class ShopSuccessUserState extends ShopStates{
  final ShopLoginModel shopLoginModel;
  ShopSuccessUserState(this.shopLoginModel);
}
class ShopSuccessGetFavoritesState extends ShopStates{

}
class ShopSuccessChangeFavorietsState extends ShopStates
{
  final ChangeFavoritesModel model;
  ShopSuccessChangeFavorietsState(this.model);
}
class ShopSuccessPostRegisterDataState extends ShopStates{
}
class ShopChangeFavorietsState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{}
class ShopErrorCategoreisState extends ShopStates{}
class ShopErrorUserState extends ShopStates{}
class ShopErrorChangeFavorietsState extends ShopStates{}
class ShopErrorGetFavorietsState extends ShopStates{}
class ShopErrorPostRegisterDataState extends ShopStates{

}
class ShopIsPasswordState extends ShopStates{}
class ShopLoadingGetFavorietsState extends ShopStates{}
class ShopLoadingUserDataState extends ShopStates{}
class ShopSuccessUserDataState extends ShopStates{
  final ShopLoginModel shopLoginModel;

  ShopSuccessUserDataState(this.shopLoginModel);
}
class ShopErrorUserDataState extends ShopStates{

}


class ShopErrorupdateState extends ShopStates{}
class ShopLoadingUpdateaState extends ShopStates{}
class ShopSuccessUpdateState extends ShopStates{
  final ShopLoginModel shopLoginModel;
  ShopSuccessUpdateState(this.shopLoginModel);
}

