import 'package:flutter/material.dart';

class ProfileALTCON extends StatelessWidget {
  const ProfileALTCON({super.key,this.width=double.infinity,this.highT=80});
  final double highT;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: AnimatedContainer(duration: const Duration(seconds: 1),
          width: width,
        height: highT,
        decoration:  BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15)
        ),


      ),
    );
  }
}
