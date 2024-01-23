
import 'package:copy/UI/MainScreen/OtherScreen/CartScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/HomeScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/ProfileScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/ShopScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/WishlistScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Colors/Colors.dart';
import '../../Component/Home Screen Component/BottomNavigation Bar/Nav Bar.dart';
import '../../State/Bottom Nav State/Bottom Nav State.dart';

class mainSceen extends StatefulWidget {
  const mainSceen({super.key});

  @override
  State<mainSceen> createState() => _mainSceenState();
}

class _mainSceenState extends State<mainSceen> {
  List<dynamic> _screen = [
    HomeScreen(),
    ShopScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context)=>Bottom_Nav_State() ,
      child: Consumer<Bottom_Nav_State>(builder: (context,provider,child){
      return Scaffold(
        body:_screen[provider.Index],

        bottomNavigationBar: Container(
          height: 90,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection:Axis.horizontal ,
              itemBuilder: (context,index){
                return InkWell(
                  splashColor: Colors.transparent,

                  onTap: (){
                    provider.setIndex(index);

                  },
                  child: AnimatedContainer(
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border(top: index==provider.Index?BorderSide(width: 3,color: AppColors.primaryColor):BorderSide(width: 3,color: Colors.white))

                    ),
                    duration: Duration(milliseconds: 800),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Icon(IconList[index],size: 30,color:index==provider.Index? AppColors.primaryColor:AppColors.secondaryColor,),
                        Text(NameList[index],style:GoogleFonts.roboto(
                          fontSize: 18,
                          color: index==provider.Index? AppColors.primaryColor:AppColors.secondaryColor,
                        ),),
                        SizedBox(
                          height: 5,
                        ),


                      ],
                    ),
                  ),
                );
              }),
        ),
      );
    },),);
  }
}
