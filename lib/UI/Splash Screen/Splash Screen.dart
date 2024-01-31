import 'dart:async';

import 'package:copy/UI/MainScreen/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {

      Navigator.pushReplacement(context,
          PageTransition(child: const MainSceen(), type: PageTransitionType.fade,duration: const Duration(seconds: 2)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image/Logo.png",
            height: 60,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BanglaDo",
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
