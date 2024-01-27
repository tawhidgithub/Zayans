import 'package:flutter/material.dart';

class CartState with ChangeNotifier{

int _count=1;

int get Count=>_count;

void setCountIncrase(){
_count++;
notifyListeners();
}


void setCountDecrease(){
_count--;
notifyListeners();
}

  
}