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
      child: const SingleChildScrollView(

        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
        
              drowerFirst(),
              SizedBox(
                height: 20,
              ),
              DrowerSecend(),
              SizedBox(
                height: 20,
              ),
              drowerThird()
        
        
            ],
          ),
        ),
      ),
    );
  }
}
