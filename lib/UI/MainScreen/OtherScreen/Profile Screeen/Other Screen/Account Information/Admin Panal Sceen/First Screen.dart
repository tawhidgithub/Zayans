import 'dart:io';

import 'package:copy/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../Component/Admin Panal Component/Input Form Field.dart';
import '../../../../../../../State/Admin State/adminState.dart';

class adminFirstScreen extends StatelessWidget {
   adminFirstScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    adminState adminController=Get.put(adminState());


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:10 ),
            child: Column(
              children: [
                Obx(() {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 150,mainAxisSpacing: 5,crossAxisSpacing: 10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,

                    itemCount: adminController.ImageList.length==0? 1:adminController.ImageList.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                            onTap: (){
                              adminController.picImage();

                            },
                            child: Container(
                              decoration:BoxDecoration(
                                  border: Border.all(width: 1,color: AppColors.primaryColor)

                              ) ,
                              child: adminController.ImageList.isEmpty?
                              Center(child: Icon(Icons.add)):Image.file(File(
                                  adminController.ImageList[index].path)),
                            )
                        ),
                      );
                    },
                  );
                }),
                InputFormField(
                  hintText: "Name *" ,
                ),
                InputFormField(
                  hintText: "price *",
                ),
                InputFormField(
                  hintText: "Tag 1 *",
                ),InputFormField(
                  hintText: "Tag 2",
                ),InputFormField(
                  hintText: "Tag 3",
                ),InputFormField(
                  hintText: "In Stock *",
                ),
        
        
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){},
              child: Container(

                height: 70,
                width: width*0.4+30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey
                ),
                child: Center(child: Text("Cancel")),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(

                height: 70,
                width: width*0.4+30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.ButtonColor
                ),
                child: Center(child: Text("Upload")),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
