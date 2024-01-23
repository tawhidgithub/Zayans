import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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
      print(e.toString());
      throw e;
    }

  }
}
