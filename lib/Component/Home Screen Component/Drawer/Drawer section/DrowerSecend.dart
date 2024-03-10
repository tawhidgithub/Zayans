import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DrowerSecend Component/DrowerSecend_Component.dart';

class DrowerSecend extends StatelessWidget {
  const DrowerSecend({super.key});

  @override
  Widget build(BuildContext context) {
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
        DrowerSecend_Component(
          tiTle: "Leptop",
          image: "assets/image/product/img1.png",
          onTap: (){},
          icon: FontAwesomeIcons.chevronRight,
        ),
        const SizedBox(
          height: 30,
        ),


      ],
    );
  }
}
