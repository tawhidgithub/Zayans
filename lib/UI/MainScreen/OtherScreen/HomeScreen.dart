import 'package:flutter/material.dart';

import '../../../Component/Home Screen Component/Family and baby/Family and baby.dart';
import '../../../Component/Home Screen Component/Free Shipping Container/Free Shipping Container.dart';
import '../../../Component/Home Screen Component/Home Screen Categories/Home Screen Categories.dart';
import '../../../Component/Home Screen Component/Mix/Mix.dart';
import '../../../Component/Home Screen Component/Watch and HeadPhone/Watch and HeadPhone.dart';
import '../../../Component/HomeScreen Add Bar/HomeScreen Add Bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon:const Icon(Icons.menu),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65),
          child: Row(
            children: [
              Image.asset(
                "assets/image/Logo.png",
                height: 60,
              ),
             const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BanglaDo",
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                     children: [
                       SizedBox(height: 5,),
                       HomeScreen_Add_Bar(),
                       SizedBox(height: 10,),
                       Home_Screen_Categories(),
                       SizedBox(height: 10,),
                       Free_Shipping_Container(),
                       SizedBox(height: 40,),
                       watch_and_HeadPhone(),
                       SizedBox(height: 40,),
                       Family_and_baby(),
                       SizedBox(height: 40,),
                       Mix()







                     ],
                            ),
                ),
          ),
        ]),
      ),
    );
  }
}
