import 'dart:collection';

import 'package:flutter/material.dart';

import '../Models/cartModel.dart';

class cartList extends ChangeNotifier {
  final List<cartModel> _items = [];

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
    double total = 0;
    for (var item in _items) {
      total += item.quantity * double.parse(item.price);
    }
    return total.toStringAsFixed(2);
  }

  void clearitems() {
    _items.clear();
    notifyListeners();
  }

  // Add Task...
  void addTask(String productName, String img, String price, int quantity) {
    bool item_contain = _items.any((item) {
      if (item.productName == productName) {
        item.quantity++;
        return true;
      }
      return false;
    });

    item_contain
        ? ""
        : _items.add(
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
