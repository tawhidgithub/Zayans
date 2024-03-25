import 'package:copy/Colors/Colors.dart';
import 'package:copy/State/Admin%20State/adminState.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadCategorie extends StatelessWidget {
  const UploadCategorie({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelect
  });

  final String title;
  final VoidCallback onTap;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      splashColor: Colors.transparent,
        onTap: onTap,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color:isSelect
                      ? AppColors.primaryColor
                      : Colors.white,
                  border: Border.all(width: 2, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                title,
                style: isSelect
                    ? GoogleFonts.roboto(
                    color: Colors.white, fontWeight: FontWeight.w700
                )
                    : GoogleFonts.roboto(
                    color: Colors.black, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ));
  }
}
