import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../State/Bottom Nav State/Bottom Nav State.dart';
import '../../../../State/Shop state/Shop state.dart';
import 'DrowerSecend Component/DrowerSecend_Component.dart';

class DrowerSecend extends StatelessWidget {
  const DrowerSecend({super.key});

  @override
  Widget build(BuildContext context) {
    Bottom_Nav_State Bottom_nav_Bar=Get.put(Bottom_Nav_State());
    ShopState2 shopState2 = Get.put(ShopState2());


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Categories",style: GoogleFonts.roboto(
            fontSize: 21,
          fontWeight: FontWeight.w500
        ),),
        const SizedBox(
          height: 20,
        ),
        DrowerSecendComponent(
          tiTle: "Leptop",
          image: "assets/image/product/img1.png",
          onTap: (){
            Bottom_nav_Bar.setIndex(1);
          },
          icon: FontAwesomeIcons.chevronRight,
        ),DrowerSecendComponent(
          tiTle: "PC",
          image: "assets/image/product/img2.png",
          onTap: (){ Bottom_nav_Bar.setIndex(1);


          },
          icon: FontAwesomeIcons.chevronRight,
        ),DrowerSecendComponent(
          tiTle: "HeadPhone",
          image: "assets/image/product/img3.png",
          onTap: (){
            Bottom_nav_Bar.setIndex(1);
          },
          icon: FontAwesomeIcons.chevronRight,
        ),DrowerSecendComponent(
          tiTle: "Watch",
          image: "assets/image/product/img4.png",
          onTap: (){
            Bottom_nav_Bar.setIndex(1);

          },
          icon: FontAwesomeIcons.chevronRight,
        ),DrowerSecendComponent(
          tiTle: "Home & Living",
          image: "assets/image/product/img5.png",
          onTap: (){
            Bottom_nav_Bar.setIndex(1);
          },
          icon: FontAwesomeIcons.chevronRight,
        ),
        const SizedBox(
          height: 30,
        ),


      ],
    );
  }
}
