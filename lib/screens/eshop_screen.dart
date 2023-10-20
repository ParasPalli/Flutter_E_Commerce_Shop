import 'package:flutter/material.dart';

import '../Widgets/Product_grid.dart';
import '../utils/fetchProducts.dart';
import 'myCart.dart';

class eshop_screen extends StatelessWidget {
  const eshop_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E - Commerce Shop"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => myCart(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ProductGrid(
              snapshot: snapshot.data,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
