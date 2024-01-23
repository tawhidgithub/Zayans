import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import '../API Model/secendModel.dart';

class secendAPICall with ChangeNotifier {

  List<SecendModel> productLIst = [];

  List get ProductList=>productLIst;

  Future<List<SecendModel>> getData() async {
    try {
      final responce = await http.get(
          Uri.parse("https://fakestoreapi.com/products"));
      var data = jsonDecode(responce.body.toString());
      if (responce.statusCode == 200) {
        for (Map i in data) {
          productLIst.add(SecendModel.fromJson(i));

        }

        return productLIst;
      }else{
        return productLIst;
      }
    } catch (e) {
      throw e;
    }
  }

}
