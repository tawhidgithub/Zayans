import 'package:flutter/cupertino.dart';

import '../../UI/MainScreen/OtherScreen/CartScreen.dart';
import '../../UI/MainScreen/OtherScreen/HomeScreen.dart';
import '../../UI/MainScreen/OtherScreen/Profile Screeen/ProfileScreen.dart';
import '../../UI/MainScreen/OtherScreen/ShopScreen.dart';
import '../../UI/MainScreen/OtherScreen/WishlistScreen.dart';

class Bottom_Nav_State with ChangeNotifier{
int _index=0;

int get Index=>_index;
void setIndex(int newIndex){
  _index=newIndex;
    notifyListeners();
  }

}
