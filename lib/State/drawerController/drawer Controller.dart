import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class DraweRController extends GetxController{
  DatabaseReference reference=FirebaseDatabase.instance.ref("User");
}