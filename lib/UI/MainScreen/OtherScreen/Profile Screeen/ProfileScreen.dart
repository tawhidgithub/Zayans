import 'package:copy/Colors/Colors.dart';
import 'package:copy/Component/Button/Button.dart';
import 'package:copy/Session%20Controller/SessionController.dart';
import 'package:copy/State/Profile%20State/profile%20state.dart';
import 'package:copy/UI/MainScreen/OtherScreen/Profile%20Screeen/Other%20Screen/Settings/help%20&%20info.dart';
import 'package:copy/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Component/Profile Component/Button/Buttons.dart';
import '../../../../No Data Page/Loading Alternative Screen PF.dart';
import '../../../../State/Log Out state/Log Out.dart';
import '../LoginScreen/LoginScreen.dart';
import 'package:get/get.dart';

import '../RagistationScreen/SingUpPage.dart';
import 'Other Screen/Account Information/Admin Panal.dart';
import 'Other Screen/Settings/App Settings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  LogOut logOutController = Get.put(LogOut());
  profileState profileController = Get.put(profileState());

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final wight = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: GoogleFonts.roboto(fontSize: 19),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(Icons.notifications_outlined)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: StreamBuilder(
        stream: profileController.ref
            .child(sessionController().userId.toString())
            .onValue,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const L0dingPF();
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            }
            else if (!snapshot.hasData || snapshot.data == null) {

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (profileController.isLOGIN.value == true)
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xfff2f1f0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(50),
                                      color: Colors.grey[350]),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.user,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Welcome",
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            color: Colors.grey.shade600),
                                      ),
                                      Text("Unnone",
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      )
                    else
                      Center(
                        child: SizedBox(
                          height: 150,
                          width: wight * 0.9,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: SizedBox(
                                    width: wight * 0.7,
                                    child: Text(
                                      "Sing in to receive exclusive offers and Promotions",
                                      style: GoogleFonts.roboto(
                                        color: Colors.grey,
                                        letterSpacing: 0.9,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    ButtoN(
                                      onClick: () {
                                        Get.to(const SingUp());
                                      },
                                      title: "Create Account",
                                      wight: wight * 0.4,
                                    ),
                                    ButtoN(
                                      onClick: () {
                                        Get.to(LoginScreen(),
                                            transition:
                                            Transition.cupertino,
                                            duration: const Duration(
                                                seconds: 5));
                                      },
                                      title: "Sing In",
                                      wight: wight * 0.4,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    /// Header

                    profileController.isLOGIN.value == true
                        ? const SizedBox(
                      height: 30,
                    )
                        : const SizedBox(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (profileController.isLOGIN.value == true)
                          Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Information",
                                  style: GoogleFonts.roboto(fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                buttons(
                                  onTap: () {
                                    Get.to(() => const L0dingPF(),
                                        transition: Transition.zoom,
                                        duration: const Duration(
                                            milliseconds: 500));
                                  },
                                  title: "My Accound",
                                  icons: Icons.person_outlined,
                                  arow: ">",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                buttons(
                                  onTap: () {
                                    Get.to(() => const SingUp(),
                                        transition: Transition.downToUp);
                                  },
                                  title: "Order & Return",
                                  icons: Icons.check_box_outline_blank,
                                  arow: ">",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                buttons(
                                  onTap: () {},
                                  title: "Wallit",
                                  icons: Icons.wallet,
                                  arow: ">",
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                buttons(
                                  onTap: () {
                                    Get.to( AdminPanal());
                                  },
                                  title: "Admin Panal",
                                  icons: Icons.download_outlined,
                                  arow: ">",
                                ),
                              ])
                        else
                          Container(),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Settings",
                          style: GoogleFonts.roboto(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        buttons(
                          onTap: () {},
                          title: "App Settings",
                          icons: Icons.settings,
                          arow: ">",
                        ),
                        const SizedBox(
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
                          onTap: () {
                            logOutController.logOut();
                          },
                          title: "Sign Out",
                          icons: Icons.logout,
                          arow: ">",
                        ),
                        SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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
                                                color: Colors
                                                    .grey.shade300)),
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.facebook,
                                            color: AppColors.ButtonColor,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: Colors
                                                    .grey.shade300)),
                                        child: const Center(
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
                )),
              );
            } else {
              Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Some thing went wrong in Profile Screen"),
                );
              }
              else if (snapshot.hasData) {

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (profileController.isLOGIN.value == true)
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: const Color(0xfff2f1f0),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.grey[350]),
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.user,
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              profileController.isLOGIN.value==true? "Welcome":"",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade600),
                                            ),
                                            Text(
                                               map!=null && map.containsKey("username")? map["username"]:"",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          else
                            Center(
                              child: SizedBox(
                                height: 150,
                                width: wight * 0.9,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: SizedBox(
                                          width: wight * 0.7,
                                          child: Text(
                                            "Sing in to receive exclusive offers and Promotions",
                                            style: GoogleFonts.roboto(
                                              color: Colors.grey,
                                              letterSpacing: 0.9,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ButtoN(
                                            onClick: () {
                                              Get.to(const SingUp());
                                            },
                                            title: "Create Account",
                                            wight: wight * 0.4,
                                          ),
                                          ButtoN(
                                            onClick: () {
                                              Get.to(LoginScreen(),
                                                  transition:
                                                      Transition.cupertino,
                                                  duration: const Duration(
                                                      seconds: 5));
                                            },
                                            title: "Sing In",
                                            wight: wight * 0.4,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                          /// Header

                          profileController.isLOGIN.value == true
                              ? const SizedBox(
                                  height: 30,
                                )
                              : const SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (profileController.isLOGIN.value == true)
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Information",
                                        style: GoogleFonts.roboto(fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      buttons(
                                        onTap: () {
                                          Get.to(() => const L0dingPF(),
                                              transition: Transition.zoom,
                                              duration: const Duration(
                                                  milliseconds: 500));
                                        },
                                        title: "My Accound",
                                        icons: Icons.person_outlined,
                                        arow: ">",
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      buttons(
                                        onTap: () {
                                          Get.to(() => const SingUp(),
                                              transition: Transition.downToUp);
                                        },
                                        title: "Order & Return",
                                        icons: Icons.check_box_outline_blank,
                                        arow: ">",
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      buttons(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminPanal()));
                                        },
                                        title: "Admin Panal",
                                        icons: Icons.download_outlined,
                                        arow: ">",

                                      ),
                                    ])
                              else
                                Container(),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Settings",
                                style: GoogleFonts.roboto(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              buttons(
                                onTap: () {
                                  Get.to(const AppSettings());
                                },
                                title: "App Settings",
                                icons: Icons.settings,
                                arow: ">",
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              buttons(
                                onTap: () {
                                  Get.to(const HelpAndInfo());
                                },
                                title: "help & info",
                                icons: Icons.info_outline,
                                arow: ">",
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              buttons(
                                onTap: () {

                                },
                                title: "hotline",
                                icons: Icons.call_sharp,
                                arow: "01303831859",
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              buttons(
                                onTap: () {
                                  logOutController.logOut();
                                },
                                title: "Sign Out",
                                icons: Icons.logout,
                                arow: ">",
                              ),
                              SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.copyright,
                                            size: 20,
                                            color: Colors.grey.shade500,
                                          ),
                                          Text(
                                            "Zayans",
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
                                                      color: Colors
                                                          .grey.shade300)),
                                              child: const Center(
                                                child: FaIcon(
                                                  FontAwesomeIcons.facebook,
                                                  color: AppColors.ButtonColor,
                                                ),
                                              )),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors
                                                          .grey.shade300)),
                                              child: const Center(
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
                      )),
                );
              } else {
                return const Center(
                  child: Text(
                      "Some thing went wrong in Profile Screen else section"),
                );
              }
            }
          }
        },
      ),
    );
  }
}
