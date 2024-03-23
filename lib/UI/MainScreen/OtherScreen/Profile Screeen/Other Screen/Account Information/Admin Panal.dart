import 'package:copy/State/Admin%20State/adminState.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Colors/Colors.dart';

class adminPanal extends StatefulWidget {
  const adminPanal({super.key});

  @override
  State<adminPanal> createState() => _adminPanalState();
}

class _adminPanalState extends State<adminPanal> {
  adminState adminController = Get.put(adminState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem<int>(value: 0, child: Text("Upload")),
                const PopupMenuItem<int>(value: 1, child: Text("Shop Adds ")),
                const PopupMenuItem<int>(value: 2, child: Text("Order")),
                const PopupMenuItem<int>(value: 3, child: Text("Order")),
                const PopupMenuItem<int>(value: 4, child: Text("User")),

              ],
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
              shadowColor: Colors.amber,

              color: Colors.white,


              onSelected: (value) {
                adminController.setvalue(value);
              },
            )
          ],
        ),
        body: Obx(() {
          return adminController.Screen[adminController.Value.value];
        }));
  }
}
