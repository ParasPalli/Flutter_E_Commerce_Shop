import 'dart:collection';

import '../Models/cartModel.dart';

class cartList {
  List<cartModel> _items = [
    cartModel(
      productName: "adfasdf",
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgt6KC-4JDGaV2UWo6XdxIyBXsK6HhV5lwtQ&usqp=CAU",
      price: "500",
      quantity: 2,
    ),
    cartModel(
      productName: "adfasdf",
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgt6KC-4JDGaV2UWo6XdxIyBXsK6HhV5lwtQ&usqp=CAU",
      price: "500",
      quantity: 2,
    ),
    cartModel(
      productName: "adfasdf",
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgt6KC-4JDGaV2UWo6XdxIyBXsK6HhV5lwtQ&usqp=CAU",
      price: "500",
      quantity: 2,
    ),
    cartModel(
      productName: "adfasdf",
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgt6KC-4JDGaV2UWo6XdxIyBXsK6HhV5lwtQ&usqp=CAU",
      price: "500",
      quantity: 2,
    ),
    cartModel(
      productName: "adfasdf",
      img:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgt6KC-4JDGaV2UWo6XdxIyBXsK6HhV5lwtQ&usqp=CAU",
      price: "500",
      quantity: 2,
    ),
  ];

  // Get Tasks List...
  UnmodifiableListView<cartModel> get items => UnmodifiableListView(_items);

  // Get Task Count...
  int get itemCount => _items.length;

  // Add Task...
  void addTask(String productName, String img, String price, int quantity) {
    _items.add(
      cartModel(
        productName: productName,
        img: img,
        price: price,
        quantity: quantity,
      ),
    );
  }
}
