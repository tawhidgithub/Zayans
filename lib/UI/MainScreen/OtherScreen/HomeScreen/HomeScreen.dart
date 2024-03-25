import 'package:copy/UI/MainScreen/OtherScreen/Cart%20Screen/CartScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../API call/API Call/API Call.dart';
import '../../../../Component/Home Screen Component/Drawer/DrawerMain.dart';
import '../../../../Component/Home Screen Component/Family and baby/Family and baby.dart';
import '../../../../Component/Home Screen Component/Footer Section/Footer Section.dart';
import '../../../../Component/Home Screen Component/Free Shipping Container/Free Shipping Container.dart';
import '../../../../Component/Home Screen Component/Home Screen Categories/Home Screen Categories.dart';
import '../../../../Component/Home Screen Component/HomeScreen Add Bar/HomeScreen Add Bar.dart';
import '../../../../Component/Home Screen Component/Mix/Mix.dart';
import '../../../../Component/Home Screen Component/Watch and HeadPhone/Watch and HeadPhone.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../State/Cart State/Cart State.dart';
import '../../../../State/Home Page Controller/Home Controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  homeScreenController homePageController=Get.put(homeScreenController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<API_Call>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const SizedBox(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Consumer<CartProvider>(builder: (context, provider2, child) {
            return badges.Badge(
              showBadge: provider2.Cart.isEmpty ? false : true,
              position: badges.BadgePosition.topEnd(top: 0, end: 0),
              badgeContent: Text(
                provider2.Cart.length.toString(),
                // Replace with your actual cart count

                style: const TextStyle(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {

                  Get.to(()=>const CartScreen(),duration: const Duration(milliseconds: 500));
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            );
          }),
          const SizedBox(
            width: 10,
          )
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Row(
            children: [
              Image.asset(
                "assets/image/App Logo/Zayans Logo.png",
                height: 60,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ZAYANS",
                    style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    "Nice Life in Unlimited Shopping",
                    style: TextStyle(fontSize: 8, color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
          elevation:0,
        child: SingleChildScrollView(
          child: DrawerMain(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Flex(direction: Axis.vertical, children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const HomeScreen_Add_Bar(),
                  const SizedBox(
                    height: 10,
                  ),
                  const HomeScreenCategories(),
                  const SizedBox(
                    height: 10,
                  ),
                  const FreeShippingContainer(),
                  const SizedBox(
                    height: 40,
                  ),
                  const WatchAndHeadPhone(),
                  const SizedBox(
                    height: 40,
                  ),
                 const Familyandbaby(),
                  const SizedBox(
                    height: 40,
                  ),
                  const Mix(),
                  const SizedBox(
                    height: 20,
                  ),
                  FooterSection()
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
