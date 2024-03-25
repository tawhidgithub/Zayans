import 'dart:io';

import 'package:copy/Utils/Utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Admin State/adminState.dart';

class UploadDataController extends GetxController {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  AdminState adminController = Get.put(AdminState());
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage
      .instance;
  RxBool logind = false.obs;
  RxBool logind2 = false.obs;
  RxBool logind3 = false.obs;

  void setLoding(bool lod) {
    logind.value = lod;
  }

  void setLoding2(bool lod) {
    logind2.value = lod;
  }

  void setLoding3(bool lod) {
    logind3.value = lod;
  }

  /// Shop Add
  void upLoadShopAdd() async {
    setLoding(true);

    firebase_storage.Reference storageRef = storage.ref("ShopAdd");

    firebase_storage.UploadTask UploadTask =
    storageRef.putFile(File(adminController.imagePath.toString()).absolute);
    await Future.value(UploadTask).then((value) async {
      final shopAddURL = await storageRef.getDownloadURL();

      dbRef.child("ShopAdd").set({
        "shopAdd": shopAddURL,
      }).then((value) {
        adminController.imagePath.value = "";
        setLoding(false);

        Utils().ErrorMesege("Add Uploaded");
      }).onError((error, stackTrace) {
        setLoding(false);

        Utils().ErrorMesege(error.toString());
        print("Error is :+ $error");
      });
    });
  }

  /// Home page Add Image

  void uploadHomeAddImage() async {
    setLoding2(true);
    List<XFile> images = adminController.imagesPathList;

    List<String> addUrl = [];
    debugPrint("The Value is" + images.length.toString());
    int num = 1;

    try {
      for (var img in images) {
        firebase_storage.Reference storageForHomeAdd =
        storage.ref().child("/HomePageAdd/image$num");

        try {
          firebase_storage.TaskSnapshot uploadTask =
          await storageForHomeAdd.putFile(File(img.path).absolute);

          String imgURL = await uploadTask.ref.getDownloadURL();
          addUrl.add(imgURL);
          num++;
        } catch (e) {
          Utils().ErrorMesege(e.toString());
        }
      }
    } catch (e) {
      Utils().ErrorMesege(e.toString());
    }


    try {
      dbRef.child("HomePageAdd").child("imageURL").set(addUrl).then((value) {
        setLoding2(false);
        Utils().ErrorMesege("Add has been upload");
        adminController.imagesPathList.value = [];
      }).onError((error, stackTrace) {
        Utils().ErrorMesege(error.toString());
      });
    } catch (e) {
      Utils().ErrorMesege(e.toString());
    }
  }

  /// Upload Product
  void uploadProduct() async {
    setLoding3(true);
    Future<int> getProductID() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      int lastProductID = preferences.getInt("lastProductID") ?? 0;
      final newProductID = lastProductID++;
      preferences.setInt("lastProductID", newProductID);
      return newProductID;
    }


    /// Upload product
    List <XFile> images = adminController.imageList;
    List imageUrl = [];

    try {
      for (var img in images) {
        firebase_storage.Reference reference = storage.ref("/Product/").child(
            "/product/${DateTime
                .now()
                .millisecond}");
        firebase_storage.UploadTask uploadTask = reference.putFile(
            File(img.path).absolute);
        firebase_storage.TaskSnapshot snapshot = await uploadTask;
        final url = await snapshot.ref.getDownloadURL();
        imageUrl.add(url);
      }
    } catch (e) {
      Utils().ErrorMesege(e.toString());
    }
    final productID = getProductID();
    final title = adminController.titleController.toString();
    final price = adminController.priceController.toString();
    final List tag = [
      adminController.tag1Controller,
      adminController.tag2Controller,
      adminController.tag3Controller,
    ];
    const brand = "Apple";
    const rating = 4.5;
    final inStack = adminController.inStockController;


    try {
      await dbRef.child("Product").child("productList").push().set({
        "id": productID,
        "title": title,
        "price": price,
        "brand": brand,
        "tag": tag,
        "rating": rating,
        "inStack": inStack,
        "images": adminController.imageList
      }).then((value) {
        setLoding3(false);
        Utils().ErrorMesege("Uploaded");
      }).onError((error, stackTrace) {
        setLoding3(false);
        Utils().ErrorMesege(error.toString());
      });
    } catch (e) {
      Utils().ErrorMesege(e.toString());
    }
  }
}
