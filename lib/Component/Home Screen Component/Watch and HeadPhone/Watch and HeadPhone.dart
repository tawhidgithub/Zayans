import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Button/Button.dart';
import 'gridview/gridview.dart';

class WatchAndHeadPhone extends StatelessWidget {
  const WatchAndHeadPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Watchs & HeadPhone",style: GoogleFonts.roboto(fontSize: 28,fontWeight: FontWeight.w400),),
          const SizedBox(height: 20,),
          const GridViewItemForWH(),
          const SizedBox(height: 80,),
          ButtoN(title: "Watch More",onClick: (){},)



        ],
      ),
    );
  }
}
