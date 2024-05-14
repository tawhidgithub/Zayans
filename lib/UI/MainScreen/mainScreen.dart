import 'package:copy/UI/MainScreen/OtherScreen/Cart%20Screen/CartScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/HomeScreen/HomeScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/Profile%20Screeen/ProfileScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/Shop%20Screenn/ShopScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/WishlistScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Colors/Colors.dart';
import '../../Component/Home Screen Component/BottomNavigation Bar/Nav Bar.dart';
import '../../State/Bottom Nav State/Bottom Nav State.dart';

class MainSceen extends StatefulWidget {
  const MainSceen({super.key});

  @override
  State<MainSceen> createState() => _MainSceenState();
}

class _MainSceenState extends State<MainSceen> {
  final List<dynamic> _screen = [
    const HomeScreen(),
    const ShopScreen(),
    const WishlistScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];


  Bottom_Nav_State nevController=Get.put(Bottom_Nav_State());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _screen[nevController.Index.value];
      }),
      bottomNavigationBar: SizedBox(
        height: 70,
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
                child: Obx((){
                  return AnimatedContainer(
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
                          size:23,
                          color: index == nevController.Index.value
                              ? AppColors.primaryColor
                              : AppColors.secondaryColor,
                        ),
                        Text(
                          NameList[index],
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
