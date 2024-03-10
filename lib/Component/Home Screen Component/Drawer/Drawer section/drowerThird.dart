import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DrowerSecend Component/DrowerSecend_Component.dart';
import 'DrowerThird Component/DrowerSecend_Component.dart';

class drowerThird extends StatelessWidget {
  const drowerThird({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Help & Info",style: GoogleFonts.roboto(
            fontSize: 21,
            fontWeight: FontWeight.w500
          ),),
          const SizedBox(
            height: 20,
          ),


          DrowerThird_Component(
            tiTle: "Terms & Condition",
            icon: FontAwesomeIcons.umbrella,
            onTap: (){},
          ), DrowerThird_Component(
            icon: FontAwesomeIcons.shield,
            tiTle: "Privacy Policies",
            onTap: (){},
          ),

        ],
      ),

    );
  }
}
