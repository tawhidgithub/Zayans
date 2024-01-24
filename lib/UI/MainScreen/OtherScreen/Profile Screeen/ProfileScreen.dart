import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Component/Profile Component/Button/Buttons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.roboto(fontSize: 19),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: FaIcon(Icons.notifications_outlined)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xfff2f1f0),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[350]),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome",
                            style: GoogleFonts.roboto(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                          Text("Tawhid Islam",
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Information",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  buttons(
                    onTap: () {},
                    title: "My Accound",
                    icons: Icons.person_outlined,
                    arow: ">",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  buttons(
                    onTap: () {},
                    title: "Order & Return",
                    icons: Icons.check_box_outline_blank,
                    arow: ">",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  buttons(
                    onTap: () {},
                    title: "Wallit",
                    icons: Icons.wallet,
                    arow: ">",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  buttons(
                    onTap: () {},
                    title: "Downloads",
                    icons: Icons.download_outlined,
                    arow: ">",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Settings",
                    style: GoogleFonts.roboto(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  buttons(
                    onTap: () {},
                    title: "App Settings",
                    icons: Icons.settings,
                    arow: ">",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  buttons(
                    onTap: () {},
                    title: "help & info",
                    icons: Icons.info_outline,
                    arow: ">",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  buttons(
                    onTap: () {},
                    title: "hotline",
                    icons: Icons.call_sharp,
                    arow: ">",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  buttons(
                    onTap: () {},
                    title: "Sing Out",
                    icons: Icons.logout,
                    arow: ">",
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.copyright,
                                size: 20,
                                color: Colors.grey.shade500,
                              ),
                              Text(
                                "BanglaDo",
                                style: GoogleFonts.roboto(
                                    color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade300)),
                                  child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.facebook,
                                      color: AppColors.ButtonColor,
                                    ),
                                  )),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade300)),
                                  child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.instagram,
                                      color: AppColors.ButtonColor,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
