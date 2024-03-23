import 'package:copy/State/Shop%20state/Shop%20state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopHeader extends StatelessWidget {
   ShopHeader({super.key});
  ShopState2 shopController=Get.put(ShopState2());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(children: [
        StreamBuilder(
          stream: shopController.dbReference.child("ShopAdd").onValue,
          builder: (context ,snapshot){
            if(!snapshot.hasData){
              return Container(
                height: height * 0.16,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://static.vecteezy.com/system/resources/thumbnails/016/317/349/small/no-ads-for-promotion-design-logo-banner-for-concept-design-sale-illustration-internet-advertisement-free-ad-blocker-flat-style-trend-modern-ban-logo-vector.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
            }
            Map<dynamic,dynamic> map=snapshot.data!.snapshot.value as Map<dynamic,dynamic>;
            return Container(
              height: height * 0.16,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  map["shopAdd"],
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          }, 
        ),
      ]),
    );
  }
}
