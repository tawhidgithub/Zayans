import 'package:flutter/material.dart';

import '../../../Component/Home Screen Categories/Home Screen Categories.dart';
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
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65),
          child: Row(
            children: [
              Image.asset(
                "assets/image/Logo.png",
                height: 60,
              ),
              Column(
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
      body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Column(
                 children: [
                   SizedBox(height: 5,),
                   HomeScreen_Add_Bar(),
                   SizedBox(height: 10,),
                   Home_Screen_Categories()


                 ],
          ),
        ),
      ]),
    );
  }
}
