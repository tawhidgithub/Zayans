import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class button extends StatelessWidget {
  const button({super.key,required this.title,required this.onClick});
  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.ButtonColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(title,style: GoogleFonts.roboto(color: Colors.white,fontSize: 18),),
        ),
      ),
    );
  }
}


