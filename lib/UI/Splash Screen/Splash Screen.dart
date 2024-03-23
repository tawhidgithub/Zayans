import 'dart:async';

import 'package:copy/UI/MainScreen/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Splash Services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState( )  {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {

      SplashServices().inLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image/App Logo/Zayans Logo.png",
            height: 80,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ZAYANS",
                style: TextStyle(fontSize: 29,
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
    );
  }
}
