import 'package:copy/UI/MainScreen/OtherScreen/Cart%20Screen/CartScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/HomeScreen/HomeScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/Profile%20Screeen/ProfileScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/ShopScreen.dart';
import 'package:copy/UI/MainScreen/OtherScreen/WishlistScreen.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Bottom_Nav_State(),
      child: Consumer<Bottom_Nav_State>(
        builder: (context, provider, child) {
          return Scaffold(
            body: _screen[provider.Index],
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
                        provider.setIndex(index);
                      },
                      child: AnimatedContainer(
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border(
                                top: index == provider.Index
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
                              color: index == provider.Index
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryColor,
                            ),
                            Text(
                              NameList[index],
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: index == provider.Index
                                    ? AppColors.primaryColor
                                    : AppColors.secondaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
