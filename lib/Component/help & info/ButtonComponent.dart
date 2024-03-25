import 'package:copy/Colors/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class buttonComponent extends StatelessWidget {
  const buttonComponent({
    super.key,
    required this.title,
    this.arow,
    required this.onTap,
    this.text = "",
    this.isTrue = false,
  });

  final String title;
  final dynamic arow;
  final VoidCallback onTap;
  final String text;
  final bool isTrue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.grey.shade200,
      splashColor: Colors.grey.shade300,
      splashFactory: InkRipple.splashFactory,
      onTap: onTap,
      child: Ink(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade300))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.w300),
              ),
              (isTrue)
                  ? FlutterSwitch(
                      value: true,
                      height: 30,
                      width: 60,
                      onToggle: (bool value) {},
                      activeColor: AppColors.primaryColor,
                      inactiveColor: Colors.grey.shade500,
                    )
                  : Row(
                      children: [
                        Text(
                          text,
                          style: GoogleFonts.roboto(
                              fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          arow,
                          style: GoogleFonts.roboto(
                              fontSize: 20, color: Colors.grey),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
