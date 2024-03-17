import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../State/Admin State/adminState.dart';

class InputFormField extends StatelessWidget {
   InputFormField({super.key,this.title="",this.price=0,this.inStack=0,this.tag="",required this.hintText});
  final String? title;
  final int? price;
  final String? tag;
  final int? inStack;
  final  hintText;
  adminState adminController=Get.put(adminState());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: TextStyle(color: AppColors.primaryColor),
        controller: adminController.inputController.value,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          label: Text(hintText),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.black
          ),
          enabledBorder: const UnderlineInputBorder(

            borderSide: BorderSide(
                color: AppColors.primaryColor
            )
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor
              )
          ),
          border: const UnderlineInputBorder(



          )
        ),
      ),
    );
  }
}
