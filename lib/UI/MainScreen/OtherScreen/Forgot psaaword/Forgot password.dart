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
import '../../../../State/Forgot Controller/Forgot Controller.dart';

class forgotPassword extends StatefulWidget {
  forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  ForgotController recoverController=Get.put(ForgotController());

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
                "Recover",
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
                            "Recover",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Enter your Email address to recover your Password .",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: const Color(0xff868F9A)),
                          ),
                          const SizedBox(
                            height: 40,
                          ),


                          textField(
                            onValidate: (value){
                              return value=="" ?"enter a Username or email":null;

                            },
                            Controller: recoverController.emailController.value,
                            label: "Email address",
                            Bool: false,

                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          Obx(() => ButtoN(
                            loding: recoverController.loding.value,
                            title: "Recover",
                            onClick: () {
                              if(_fromKey.currentState!.validate()){
                                recoverController.recoverPassword();

                              }
                            },
                          ),)
                        ],
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 140),
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    RotateAnimatedText("Password",
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
