import 'package:copy/Session%20Controller/SessionController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../State/Log Out state/Log Out.dart';
import '../../../../State/Profile State/profile state.dart';
import '../../../../State/drawerController/drawer Controller.dart';

class DrowerFirst extends StatelessWidget {
   DrowerFirst({super.key});

  DraweRController drawerController = Get.put(DraweRController());

  @override
  Widget build(BuildContext context) {

    LogOut logOutController = Get.put(LogOut());
    profileState profileController=Get.put(profileState());


    return StreamBuilder(
        stream: drawerController.reference
            .child(sessionController().userId.toString())
            .onValue,
        builder: (context, snapshot) {
          if (snapshot != null && snapshot.hasData) {
            Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as Map<
                dynamic,
                dynamic>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,


                    color: Colors.grey[350],


                  ),
                  child: const Center(child: FaIcon(
                      FontAwesomeIcons.userLarge, color: Colors.white,
                      size: 50)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Obx(() {
                    return Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( profileController.isLOGIN.value ?  map["username"]:"Unknown", style: GoogleFonts.roboto(
                            fontSize: 20, fontWeight: FontWeight.w500),),
                        Text( profileController.isLOGIN.value ?  map["email"]:"Unknown@gmail.com",style: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w500),),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            logOutController.logOut();
                          },
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.rightFromBracket, size: 20,
                                color: Colors.grey[500],),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("LOGOUT", style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.w300),),
                            ],
                          ),
                        ),

                      ],
                    );
                  }),
                ),
                const SizedBox(
                  height: 30,
                ),


              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,


                    color: Colors.grey[350],


                  ),
                  child: const Center(child: FaIcon(
                      FontAwesomeIcons.userLarge, color: Colors.white,
                      size: 50)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name", style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w500),),
                      Text("titawhid02@gmail.com", style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w500),),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.rightFromBracket, size: 20,
                              color: Colors.grey[500],),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("LOGOUT", style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),


              ],
            );
          }
        });
  }
}
