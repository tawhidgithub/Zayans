import 'dart:io';

import 'package:copy/Utils/Utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import '../Admin State/adminState.dart';

class UploadDataController extends GetxController {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  adminState adminController = Get.put(adminState());
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  RxBool logind = false.obs;
  RxBool logind2 = false.obs;

  void setLoding(bool lod) {
    logind.value = lod;

  }void setLoding2(bool lod) {
    logind2.value = lod;

  }

  void upLoadShopAdd() async{
    setLoding(true);

    firebase_storage.Reference storageRef = storage.ref("ShopAdd");

    firebase_storage.UploadTask UploadTask =
        storageRef.putFile(File(adminController.imagePath.toString()).absolute);
    await Future.value(UploadTask).then((value)async {
      final ShopAddURL= await storageRef.getDownloadURL();


      dbRef.child("ShopAdd").set({
        "shopAdd":ShopAddURL,
      }).then((value) {
        adminController.imagePath.value="";
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

void uploadHomeAddImage()async{
  setLoding2(true);
  List<XFile> images=adminController.ImagesPath;

  List<String> AddUrl=[];
  debugPrint("The Value is"+images.length.toString());
  int num=1;
  for(var img in images){


    firebase_storage.Reference storageForHomeAdd=storage.ref().child("/HomePageAdd/image$num");


    try{
      firebase_storage.TaskSnapshot uploadTask= await storageForHomeAdd.putFile(File(img.path).absolute);

      String imgURL=await uploadTask.ref.getDownloadURL();
      AddUrl.add(imgURL);
      num++;
    }catch(e){
      Utils().ErrorMesege(e.toString());
    }



  }

  try{


    dbRef.child("HomePageAdd").child("imageURL").set(AddUrl).then((value) {
      setLoding2(false);
      Utils().ErrorMesege("Add has been upload");
      adminController.ImagesPath.value=[];


    }).onError((error, stackTrace) {
      Utils().ErrorMesege(error.toString());

    });
  }catch(e){
    Utils().ErrorMesege(e.toString());
  }












}



}
