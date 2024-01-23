import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../API call/API Call/API Call.dart';
import '../../../Component/Home Screen Component/Family and baby/Family and baby.dart';
import '../../../Component/Home Screen Component/Footer Section/Footer Section.dart';
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
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
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
                  const Home_Screen_Categories(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Free_Shipping_Container(),
                  const SizedBox(
                    height: 40,
                  ),
                  const watch_and_HeadPhone(),
                  const SizedBox(
                    height: 40,
                  ),
                  const Family_and_baby(),
                  const SizedBox(
                    height: 40,
                  ),
                  const Mix(),
                  const SizedBox(
                    height: 20,
                  ),
                  footerSection()
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
