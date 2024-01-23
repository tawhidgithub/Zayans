import 'package:flutter/cupertino.dart';

class DetailsState with ChangeNotifier {
  int _onPageChange = 1;

  int get onPageChange => _onPageChange;

  void setonPageChange(int OnPageChange) {
    _onPageChange = OnPageChange;
    notifyListeners();
  }
}
