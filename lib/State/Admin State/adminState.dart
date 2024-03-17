import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../UI/MainScreen/OtherScreen/Profile Screeen/Other Screen/Account Information/Admin Panal Sceen/First Screen.dart';
import '../../UI/MainScreen/OtherScreen/Profile Screeen/Other Screen/Account Information/Admin Panal Sceen/Secend Screen.dart';
import '../../UI/MainScreen/OtherScreen/Profile Screeen/Other Screen/Account Information/Admin Panal Sceen/Threed Screen.dart';

class adminState extends GetxController {
  // Pop Up Value Change
  RxInt Value = 1.obs;

  void setvalue(int val) {
    Value.value = val;
  }

  RxList Screen = [
    adminFirstScreen(),
    const adminSecendScreen(),
    const adminThreedScreen()
  ].obs;

//Controller for Input Text Field
  final Rx<TextEditingController> inputController = TextEditingController().obs;

  /// Image picker from Gallery for Upload
  RxList<XFile> ImageList = <XFile>[].obs;

  Future picImage() async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? images = await _picker.pickMultiImage();
    if (images!.isNotEmpty) {
      ImageList.addAll(images);
    }
  }

  /// Image picker from Gallery for Shop Adds
  RxString imagepath = "".obs;

  Future PicImage2() async {
    final ImagePicker _pikImage = ImagePicker();
    final image2= await _pikImage.pickImage(source: ImageSource.gallery);
    if(image2!=null){
      imagepath.value=image2.path;

    }

  }





/// Image picker from Gallery for Home Page Adds
RxList<XFile> ImagesPath=<XFile>[].obs;
  Future picImage3()async{
    final ImagePicker picker3=ImagePicker();
     List<XFile> Images3= await picker3.pickMultiImage();
    if(Images3!=null ){
      ImagesPath.addAll(Images3);
    }
  }



  /// Threed Screen
RxList User=[].obs;





}
