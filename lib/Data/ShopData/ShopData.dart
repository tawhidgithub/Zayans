import 'package:copy/Component/ShopComponent/ShopRightScreens/BabyProductScreen.dart';
import 'package:copy/Component/ShopComponent/ShopRightScreens/Electronic.dart';
import 'package:copy/Component/ShopComponent/ShopRightScreens/LaptopScreen.dart';
import 'package:copy/Component/ShopComponent/ShopRightScreens/ManClothScreen.dart';
import 'package:copy/Component/ShopComponent/ShopRightScreens/PCScreen.dart';
import 'package:copy/Component/ShopComponent/ShopRightScreens/WatchesScreen.dart';
import 'package:copy/Component/ShopComponent/ShopRightScreens/WomenCloth.dart';
import 'package:flutter/cupertino.dart';

class ShopData{
  List ShopName=[
    "PC",
    "Laptop",
    "Watches",
    "Man's Clothing",
    "Women's Clothing",
    "Baby Product",
    "Electronics",
  ];



  List ShopScreen=[
    PCScreen(),
    LaptopScreen(),
    WatcheScreen(),
    ManClothScreen(),
    WomenClothScreen(),
    BabyProductScreen(),
    ElectonicScreen()

  ];




}