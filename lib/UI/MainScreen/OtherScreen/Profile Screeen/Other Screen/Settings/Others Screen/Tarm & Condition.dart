import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Center(
            child: FaIcon(
                FontAwesomeIcons.chevronLeft
            ),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Term & Condition",
          style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
