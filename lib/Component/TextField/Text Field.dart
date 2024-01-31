import 'package:copy/Colors/Colors.dart';
import 'package:copy/State/LoginPageState/LoginPsgeState.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Utils/Utils.dart';

class textField extends StatelessWidget {
  const textField(
      {super.key,
      required this.Controller,
      required this.label,
      this.icon1,
      this.icon2,
      this.Bool = true,
      this.onClick,
      this.onChange,
      this.FocusController,
      required this.onValidate});

  final String label;
  final Controller;
  final icon1;
  final icon2;
  final bool Bool;
  final VoidCallback? onClick;
  final Function? onChange;
  final FocusNode? FocusController;
  final FormFieldValidator onValidate;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginScreenState>(builder: (context, provider, child) {
      return TextFormField(
        validator: onValidate,
        focusNode: FocusController,
        obscureText: Bool,
        controller: Controller,
        cursorColor: AppColors.primaryColor,
        cursorHeight: 20,
        cursorWidth: 1,

        style: GoogleFonts.roboto(
            fontSize: 20, fontWeight: FontWeight.w300, letterSpacing: 1),
        decoration: InputDecoration(
            suffixIcon: provider.Eyes == false
                ? IconButton(
                    onPressed: onClick,
                    icon: FaIcon(
                      icon1,
                      size: 15,
                      color: Colors.grey.shade600,
                    ),
                  )
                : IconButton(
                    onPressed: onClick,
                    icon: FaIcon(
                      icon2,
                      size: 15,
                      color: Colors.grey.shade600,
                    ),
                  ),
            label: Text(label),
            labelStyle: GoogleFonts.roboto(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 0.5, color: AppColors.secondaryColor)),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 0.5, color: AppColors.secondaryColor))),
        onChanged: (change)=>onChange,
      );
    });
  }
}
