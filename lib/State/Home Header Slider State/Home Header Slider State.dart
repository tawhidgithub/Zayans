import 'package:flutter/material.dart';

class Home_Header_Slider_State with ChangeNotifier{
  int _index=0;
  int get Index=>_index;
  void setIndex(int ind){
    _index=ind;
    notifyListeners();
  }
}