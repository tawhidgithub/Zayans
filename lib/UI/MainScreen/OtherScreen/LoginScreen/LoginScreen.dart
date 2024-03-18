import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:copy/Colors/Colors.dart';
import 'package:copy/State/LoginPageState/LoginPageState.dart';
import 'package:copy/UI/MainScreen/OtherScreen/RagistationScreen/SingUpPage.dart';
import 'package:copy/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../Component/Button/Button.dart';
import '../../../../Component/TextField/Text Field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

   LoginState loginController=Get.put(LoginState());

  final _fromKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginScreenState(),
      child: Consumer<LoginScreenState>(builder: (context, provider, child) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Login",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _fromKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Login",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an account to continue",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: const Color(0xff868F9A)),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Accept the terms and conditions",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: const Color(0xff868F9A)),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          textField(
                            onValidate: (value){
                              return value=="" ?"enter a Username or email":null;

                            },
                            Controller: loginController.emailController.value,
                            label: "Username or email address",
                            Bool: false,

                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          textField(
                            onValidate: (value){
                              return value=="" ?"enter a Password":null;
                            },
                            Controller: loginController.passController.value,
                            label: "Password",
                            icon1: FontAwesomeIcons.eye,
                            icon2: FontAwesomeIcons.eyeSlash,
                            Bool: provider.Eyes,
                            onClick: () {
                              provider.setEyes();
                            },

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Forgot Password?",
                                    style: GoogleFonts.roboto(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Obx(() => ButtoN(
                            loding: loginController.loding.value,
                            title: "Login",
                            onClick: () {
                              if(_fromKey.currentState!.validate()){
                                loginController.Login();

                              }
                            },
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ?",
                              style: GoogleFonts.roboto(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15)),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(() => const SingUp(),
                                    duration:
                                        const Duration(milliseconds: 600));
                              },
                              child: Text("Register Now",
                                  style: GoogleFonts.roboto(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15))),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 230),
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    RotateAnimatedText("Email",
                        textStyle: GoogleFonts.roboto(
                            fontSize: 25,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700))
                  ]),
                )
              ]),
            ),
          ),
        );
      }),
    );
  }
}
