import 'package:copy/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class SignUpScreenState with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child("User");



  // Obscure Text

  bool _eyes = true;

  get Eyes => _eyes;

  void setEyes() {
    if (_eyes == false) {
      _eyes = true;
    } else if (_eyes == true) {
      _eyes = false;
    }

    notifyListeners();
  }

// Loging
  bool _logind = false;

  bool get Loding => _logind;

  void setLoding(bool lod) {
    _logind = lod;
    notifyListeners();
  }

  //  Sign Up

  void signUp(
      String firstName,
      String lastName,
      dynamic username,
      String email,
      String password )async {
    setLoding(true);


    try {
      auth
          .createUserWithEmailAndPassword(
          email:email,
          password: password
      ).then((value){
        setLoding(false);

        ref.child(value.user!.uid.toString()).set({
          "id":value.user!.uid.toString(),
          "email":email,
          "name":firstName+" "+lastName,
          "username":username,
          "phone":""



        }).then((value) {
          setLoding(false);

          Utils().ErrorMesege("Add to Database");
        }).onError((error, stackTrace) {
          setLoding(false);


          Utils().ErrorMesege(error.toString());
        });
        Utils().ErrorMesege("You have been ragister");



      }).onError((error, stackTrace) {
        Utils().ErrorMesege(error.toString());
      });
    } catch (e) {
      Utils().ErrorMesege(e.toString());
    }
  }
}
