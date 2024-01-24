import 'package:flutter/cupertino.dart';

class shop_state with ChangeNotifier{

  var _focus=false;
  bool get Focus=>_focus;

  void setFocus(bool focus){
    _focus=focus;
    notifyListeners();

  }




}