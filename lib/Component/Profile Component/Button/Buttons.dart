import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class buttons extends StatelessWidget {
  const buttons(
      {super.key,
      required this.icons,
      required this.title,
      this.arow,
      this.number = 0,
      required this.onTap});

  final IconData icons;
  final String title;
  final int number;
  final arow;
  final VoidCallback onTap;

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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FaIcon(
                    icons,
                    size: 23,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Text(
                arow,
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
