import 'package:ecommerce_shop/utils/cartList.dart';
import 'package:flutter/material.dart';

import '../Widgets/cartItem.dart';

class myCart extends StatelessWidget {
  const myCart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: const Text(
            "My Cart",
          ),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: cartList().itemCount,
              itemBuilder: (context, index) {
                return cartItem(
                  index: index,
                );
              },
            ),
          ),
        ),
        bottomSheet: BottomAppBar(
          color: Colors.red,
          height: MediaQuery.of(context).size.height / 13,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "\$252",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Payment Gateway Code....
                  },
                  icon: const Icon(
                    Icons.send,
                  ),
                  label: const Text(
                    "Check Out",
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
