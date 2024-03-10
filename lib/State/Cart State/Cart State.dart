import 'package:flutter/material.dart';

import '../../API call/API Model/API Model.dart';

class CartState with ChangeNotifier {
  // Item Count
  int _count = 1;

  int get Count => _count;

  void setCountIncrase() {
    _count++;
    notifyListeners();
  }

  void setCountDecrease() {
    _count--;
    notifyListeners();
  }
}

class CartProvider with ChangeNotifier {
  // Add,remove,Edit to Cart
  List _cart = [];
  get Cart=>_cart;

  void addtoCart(String name, int price, quantity, String image) {
    _cart.add(
        {"name": name, "price": price, "quantity": quantity, "Image": image});
    notifyListeners();
  }

  void removetoCart(int index) {
    Cart.removeAt(index);
    notifyListeners();
  }

  void removeAllCart() {
    Cart.clear();
    notifyListeners();
  }







// Calculation Price



  num _total = 0;

  num get Total => _total;

  void calculate() {
    _total = 0;

    for (var i = 0; i < Cart.length; i++) {
      _total += Cart[i]["price"];
    }

    notifyListeners();
  }
}
