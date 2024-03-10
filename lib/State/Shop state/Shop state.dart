import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class shop_state with ChangeNotifier{

  var _focus=false;
  bool get Focus=>_focus;

  void setFocus(bool focus){
    _focus=focus;
    notifyListeners();

  }

}


class ShopState2 extends GetxController{

  RxInt index=0.obs;

  void setIndex(int ind){
    index.value=ind;

  }



}
