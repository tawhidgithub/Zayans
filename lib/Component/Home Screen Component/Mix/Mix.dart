import 'package:flutter/material.dart';

import '../../Button/Button.dart';
import 'gridview/gridview.dart';

class Mix extends StatelessWidget {
  const Mix({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
         const SizedBox(height: 20,),
          const GridViewItemForMix(),
          const SizedBox(height: 80,),
          button(title: "Watch More",onClick: (){},)



        ],
      ),
    );
  }
}
