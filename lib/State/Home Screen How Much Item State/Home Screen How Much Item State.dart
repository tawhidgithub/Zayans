import 'package:flutter/cupertino.dart';

class Home_Screen_How_Much_Item_State with ChangeNotifier{
  int _count=1;
  int get Count=>_count;
  void setAddCount(){
    _count++;
    notifyListeners();
  }
  void setremoveCount(){

    if(_count>0){
      _count--;
    }

    notifyListeners();
  }
}