import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class homeScreenController extends GetxController{
  DatabaseReference reference=FirebaseDatabase.instance.ref("HomePageAdd").child("imageURL");
  
  
}