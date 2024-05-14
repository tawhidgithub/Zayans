import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../State/Bottom Nav State/Bottom Nav State.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  Bottom_Nav_State nevController=Get.put(Bottom_Nav_State());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                nevController.setIndex(index);
              },
              child: Obx(() {
                return  AnimatedContainer(
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border(
                          top: index == nevController.Index.value
                              ? const BorderSide(
                              width: 3, color: AppColors.primaryColor)
                              : const BorderSide(
                              width: 3, color: Colors.white))),
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Icon(
                        IconList[index],
                        size: 30,
                        color: index == nevController.Index.value
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor,
                      ),
                      Text(
                        NameList[index],
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: index == nevController.Index.value
                              ? AppColors.primaryColor
                              : AppColors.secondaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                );
              }),
            );
          }),
    );
  }
}

List NameList = ["Home", "Shop", "Wishlist", "Cart", "me"];
List IconList = [
  Icons.home_outlined,
  Icons.search_outlined,
  Icons.favorite_outline,
  Icons.shopping_cart_outlined,
  Icons.person
];
