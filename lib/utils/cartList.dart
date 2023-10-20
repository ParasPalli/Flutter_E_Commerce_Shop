import 'dart:collection';

import 'package:flutter/material.dart';

import '../Models/cartModel.dart';

class cartList extends ChangeNotifier {
  List<cartModel> _items = [];

  // Get Tasks List...
  UnmodifiableListView<cartModel> get items => UnmodifiableListView(_items);

  // Get Task Count...
  int get itemCount => _items.length;

  incrementQuantity(int index) => _items[index].quantity++;
  decrementQuantity(int index) =>
      _items[index].quantity != 1 ? _items[index].quantity-- : 1;

  void deleteItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  String getTotal() {
    int total = 0;

    for (cartModel item in _items) {
      // total = item.quantity * item.price
    }

    return total.toString();
  }

  // Add Task...
  void addTask(String productName, String img, int price, int quantity) {
    _items.add(
      cartModel(
        productName: productName,
        img: img,
        price: price,
        quantity: quantity,
      ),
    );
    notifyListeners();
  }
}
