import 'package:ecommerce_shop/screens/eshop_screen.dart';
import 'package:ecommerce_shop/utils/cartList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<cartList>(
      create: (context) => cartList(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: eshop_screen(),
      ),
    );
  }
}
