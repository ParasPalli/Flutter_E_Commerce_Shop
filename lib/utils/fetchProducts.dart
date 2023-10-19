import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Models/products.dart';

List<Products> parseProducts(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['products'].cast<Map<String, dynamic>>();

  return parsed.map<Products>((json) => Products.fromJson(json)).toList();
}

Future<List<Products>> fetchProducts() async {
  var result = await http.get(Uri.parse("https://dummyjson.com/products"));

  if (result.statusCode == 200) {
    return compute(parseProducts, result.body);
  } else {
    throw Exception('Failed to load album');
  }
}
