import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtoN extends StatelessWidget {
  const ButtoN({super.key,required this.title,required this.onClick ,this.loding=false});
  final String title;
  final VoidCallback onClick;
  final bool loding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.ButtonColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child:loding ? const CircularProgressIndicator():Text(title,style: GoogleFonts.roboto(color: Colors.white,fontSize: 18),),
        ),
      ),
    );
  }
}


