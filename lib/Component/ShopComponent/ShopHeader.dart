import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopHeader extends StatelessWidget {
  const ShopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(children: [
        Container(
          height: Height * 0.16,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/image/product/product1.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ]),
    );
  }
}
