import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../State/Shop state/Shop state.dart';
import '../API Model/API Model.dart';

class API_Call with ChangeNotifier {


  Future<APIModel> getData() async {
    try {
      String uRL = "https://dummyjson.com/products";

      final responce = await http.get(Uri.parse(uRL));
      final json = jsonDecode(responce.body.toString());
      if (responce.statusCode == 200) {

        return APIModel.fromJson(json);
      }else{
        return APIModel.fromJson(json);
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
      throw e;
    }

  }

  List<String> searchName=[];




}
