import 'package:copy/UI/MainScreen/OtherScreen/Profile%20Screeen/Other%20Screen/Settings/Others%20Screen/Contact%20us.dart';
import 'package:copy/UI/MainScreen/OtherScreen/Profile%20Screeen/Other%20Screen/Settings/Others%20Screen/Privacy%20Policoes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../Component/Profile Component/Button/Buttons.dart';
import '../../../../../../Component/help & info/ButtonComponent.dart';
import 'Others Screen/Tarm & Condition.dart';

class HelpAndInfo extends StatelessWidget {
  const HelpAndInfo({super.key});

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
          "Help & Info",
          style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          buttonComponent(
            title: "contact",
              arow: ">",
              onTap:(){
              Get.to(const ContactUs());
              }
          ),buttonComponent(
            title: "privacy policies",
              arow: ">",
              onTap:(){
              Get.to(const privacyPolicies());
              }
          ),buttonComponent(
            title: "Term & Condition",
              arow: ">",
              onTap:(){Get.to(const TermsAndCondition());}
          ),buttonComponent(
            title: "Rate This App",
              arow: ">",
              onTap:(){}
          ),
        ],
      ),
    );
  }
}
