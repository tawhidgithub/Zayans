import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../State/Bottom Nav State/Bottom Nav State.dart';

class Bottom_Nav_Bar extends StatefulWidget {
  const Bottom_Nav_Bar({super.key});

  @override
  State<Bottom_Nav_Bar> createState() => _Bottom_Nav_BarState();
}

class _Bottom_Nav_BarState extends State<Bottom_Nav_Bar> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>Bottom_Nav_State(),
      child: Consumer<Bottom_Nav_State>(builder: (context,provider,child){
        return Container(
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
        );
      },),

    );
  }
}



List NameList=[
  "Home",
  "Shop",
  "Wishlist",
  "Cart",
  "me"
];
List IconList=[
  Icons.home_outlined,
  Icons.search_outlined,
  Icons.favorite_outline,
  Icons.shopping_cart_outlined,
  Icons.person
];
