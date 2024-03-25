import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../UI/MainScreen/OtherScreen/Profile Screeen/Other Screen/Account Information/Admin Panal Sceen/First Screen.dart';
import '../../UI/MainScreen/OtherScreen/Profile Screeen/Other Screen/Account Information/Admin Panal Sceen/Secend Screen.dart';
import '../../UI/MainScreen/OtherScreen/Profile Screeen/Other Screen/Account Information/Admin Panal Sceen/Threed Screen.dart';

class AdminState extends GetxController {
  // Pop Up Value Change
  RxInt Value = 0.obs;

  void setvalue(int val) {
    Value.value = val;
  }

  RxList Screen = [
    adminFirstScreen(),
    const adminSecendScreen(),
    const adminThreedScreen(),
    const adminThreedScreen(),
    const adminThreedScreen(),
    const adminThreedScreen()
  ].obs;

  ///
  RxList<XFile> imageList = <XFile>[].obs;
  RxString imagePath = "".obs;
  RxList<XFile> imagesPathList = <XFile>[].obs;

  /// upload product
  Future<void> picImage() async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? images = await _picker.pickMultiImage();
    if (images != null && images.isNotEmpty) {
      imageList.addAll(images);
    }
  }
///Shop Add
  Future<void> picImage2() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
    }
  }
/// Home Page Add

  Future picImage3() async {
    final ImagePicker picker3 = ImagePicker();
    List<XFile> images3 = await picker3.pickMultiImage();
    if (images3 != null && images3.isNotEmpty) {
      imagesPathList.addAll(images3);
    }
  }

  RxBool isSelectBaby = false.obs;
  RxBool isSelectMan = false.obs;
  RxBool isSelectWomen = false.obs;
  RxBool isSelectFood = false.obs;
  RxBool isSelectToy = false.obs;

  void setIsSelect(String category) {
    isSelectBaby.value = category == "Baby";
    isSelectMan.value = category == "Man";
    isSelectWomen.value = category == "Women";
    isSelectFood.value = category == "Food";
    isSelectToy.value = category == "Toy";
  }

  /// Retrieve Text
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final tag1Controller = TextEditingController();
  final tag2Controller = TextEditingController();
  final tag3Controller = TextEditingController();
  final inStockController = TextEditingController();
}
