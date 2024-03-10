import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DrowerThird_Component extends StatelessWidget {

  const DrowerThird_Component({super.key,required this.onTap,required this.tiTle,required this.icon});

  final String tiTle;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        highlightColor: AppColors.ContainerBackColor,
        splashColor: AppColors.ContainerBackColor,
        splashFactory: InkRipple.splashFactory,


        onTap: onTap,
        child: Ink(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: Colors.grey.shade200,
              ))),
              child: Row(
                children: [
                  FaIcon(icon,size: 20,color: Colors.grey.shade400,),
      
      
      
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(tiTle,style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w300,
                          fontSize: 18
                      ),),
      
                    ],
                  ),
      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
