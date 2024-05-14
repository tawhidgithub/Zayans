import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../UI/MainScreen/OtherScreen/Cart Screen/CartScreen.dart';
import '../../UI/MainScreen/OtherScreen/HomeScreen/HomeScreen.dart';
import '../../UI/MainScreen/OtherScreen/Profile Screeen/ProfileScreen.dart';
import '../../UI/MainScreen/OtherScreen/Shop Screenn/ShopScreen.dart';
import '../../UI/MainScreen/OtherScreen/WishlistScreen.dart';

class Bottom_Nav_State extends GetxController{
RxInt Index=0.obs;


void setIndex(int newIndex){
  Index.value=newIndex;

  }

}
