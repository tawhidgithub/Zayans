import 'package:flutter/material.dart';

import 'Drawer section/DrowerSecend.dart';
import 'Drawer section/drowerFirst.dart';
import 'Drawer section/drowerThird.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key});




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  SingleChildScrollView(

        scrollDirection: Axis.vertical,
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 20,),
        
              DrowerFirst(),
             const SizedBox(
                height: 20,
              ),
             const DrowerSecend(),
             const SizedBox(
                height: 20,
              ),
             const drowerThird()
        
        
            ],
          ),
        ),
      ),
    );
  }
}
