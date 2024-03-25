import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class FamilyAndBabyController extends GetxController{

  DatabaseReference ref=FirebaseDatabase.instance.ref().child("Product").child("product");


}