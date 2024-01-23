
import 'dart:convert';

import '../API Model/ModelThree.dart';
import 'package:http/http.dart' as http;

class APIcallThree {
  Future <ModelThree>getData()async{
    try{

      final url="https://dummyjson.com/products/category/smartphones";
      final responce=await http.get(Uri.parse(url));
      var date=jsonDecode(responce.body.toString());
      if(responce.statusCode==200){
        return ModelThree.fromJson(date);

      }else{
        return ModelThree.fromJson(date);

      }


    }catch(e){
      throw e;
    }

  }
}