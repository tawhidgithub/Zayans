import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DrowerSecendComponent extends StatelessWidget {
  const DrowerSecendComponent({super.key,required this.image,required this.onTap,required this.tiTle,this.icon});

  final String tiTle;
  final String image;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: InkWell(
          highlightColor: AppColors.ContainerBackColor,
          splashColor: AppColors.ContainerBackColor,
          splashFactory: InkRipple.splashFactory,


          onTap: (){},
          child: Ink(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            
                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.ContainerBackColor
                          ),
                          height: 30,
                          child: Image.asset(
                            image,height: 30,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(tiTle,style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w300,
                          fontSize: 18
                      ),),
            
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),

                    child: FaIcon(icon,size: 15,color: Colors.grey.shade400,),
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
