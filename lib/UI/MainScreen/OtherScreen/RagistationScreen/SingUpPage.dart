import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:copy/Colors/Colors.dart';
import 'package:copy/State/LoginPageState/LoginPageState.dart';
import 'package:copy/UI/MainScreen/OtherScreen/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../Component/Button/Button.dart';
import '../../../../Component/TextField/Text Field.dart';
import '../../../../State/SignUpState/SignUpState.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});


  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  SingUpState SingUpController=Get.put(SingUpState());
  final _formKey = GlobalKey<FormState>();

 

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
                "Register",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              centerTitle: false,
            ),
            body: ChangeNotifierProvider(
              create: (context) => SignUpScreenState(),
              child: Consumer<SignUpScreenState>(
                builder: (context, provider, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Stack(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "Register",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25),
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
                                const SizedBox(
                                  height: 10,
                                ),
                                textField(
                                  onValidate: (value) {
                                    return value == ""
                                        ? "enter First Name"
                                        : null;
                                  },
                                  Controller: SingUpController.firstNameController.value,
                                  label: "First Name",
                                  Bool: false,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                textField(
                                  onValidate: (value) {
                                    return value == ""
                                        ? "enter Last Name"
                                        : null;
                                  },
                                  Controller: SingUpController.lastNameController.value,
                                  label: "Last Name",
                                  Bool: false,
                                  onClick: () {
                                    provider.setEyes();
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                textField(
                                  onValidate: (value) {
                                    return value == ""
                                        ? "enter User Name"
                                        : null;
                                  },
                                  Controller: SingUpController.userNameController.value,
                                  label: "User Name",
                                  Bool: false,
                                  onClick: () {
                                    provider.setEyes();
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                textField(
                                  onValidate: (value) {
                                    return value == "" ? "enter a Email" : null;
                                  },
                                  Controller: SingUpController.emailController.value,
                                  label: "Email",
                                  Bool: false,
                                  onClick: () {
                                    provider.setEyes();
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                textField(
                                  onValidate: (value) {
                                    return value == ""
                                        ? "enter a Password"
                                        : null;
                                  },
                                  Controller: SingUpController.passController.value,
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
                               Obx(() {
                                 return  ButtoN(
                                   title: "Register",
                                   loding: SingUpController.logind.value,
                                   onClick: () {
                                     if (_formKey.currentState!.validate()) {
                                       SingUpController.singUp();




                                     }
                                   },
                                 );
                               })
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: InkWell(
                                onTap: () {
                                  Get.to(() => LoginScreen(),
                                      duration: const Duration(
                                          milliseconds: 600));
                                },
                                child: Text("Already have an account ?",
                                    style: GoogleFonts.roboto(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15))),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 180),
                        child: AnimatedTextKit(
                            repeatForever: true, animatedTexts: [
                          RotateAnimatedText("Email",
                              textStyle: GoogleFonts.roboto(
                                  fontSize: 25,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w700))
                        ]),
                      )
                    ]),
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
