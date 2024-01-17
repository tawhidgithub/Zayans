import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'GridView/GridView.dart';

class Free_Shipping_Container extends StatelessWidget {
  const Free_Shipping_Container({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Free Shipping",style: GoogleFonts.roboto(fontSize: 28,fontWeight: FontWeight.w400),),
          SizedBox(height: 20,),
          GridViewItem(),


        ],
      ),
    );
  }
}
