abstract class ShopLoginStates {}

class ShopLoginIntialState extends ShopLoginStates{}
class ShopLoginLoadingState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{}
class ShopChangePasswordVisibilityState extends ShopLoginStates{}

class ShopLoginIErrorState extends ShopLoginStates{

  final String error;
  ShopLoginIErrorState(this.error);
}

