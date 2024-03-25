import 'package:copy/Colors/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Center(
            child: FaIcon(FontAwesomeIcons.chevronLeft),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Contact Us",
          style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Lottie.asset("assets/lottie/ContactUs.json",
                height: 400, width: 400),
            Container(
              height: 180,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xffe6e6e3),
                        offset: Offset(0, 2),
                        spreadRadius: 1,
                        blurRadius: 5)
                  ]),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Head Office",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        FaIcon(Icons.call_outlined,color:  AppColors.secondaryColor,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "01303831859",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        FaIcon(Icons.email_outlined,color: AppColors.secondaryColor,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "titawhid02@gmail.com",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),
                        )
                      ],
                    ), Row(
                      children: [
                        FaIcon(Icons.location_on_outlined,color: AppColors.secondaryColor,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Khilbarirtek,shahjadpur,vatara ,Dhaka 1212",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
