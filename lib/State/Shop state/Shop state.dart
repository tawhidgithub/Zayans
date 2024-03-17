import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../API call/API Call/API Call.dart';

class shop_state with ChangeNotifier{

  var _focus=false;
  bool get Focus=>_focus;

  void setFocus(bool focus){
    _focus=focus;
    notifyListeners();

  }

}


class ShopState2 extends GetxController{


  // Controller for Search Bar
final searchController = TextEditingController().obs;
  RxList searchList=[].obs;


  RxInt index=0.obs;

  void setIndex(int ind){
    index.value=ind;

  }

  // Search State

RxList searchItem=[].obs;

 void setSearchText(List seaRch){

       searchItem..value.add(seaRch);

 }



}
