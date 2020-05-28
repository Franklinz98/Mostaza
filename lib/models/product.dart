import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final String quantity;
  final String key;
  final String price;

  const Product(
      {@required this.name,
      @required this.quantity,
      @required this.key,
      @required this.price});

  factory Product.fromJson(String key, Map<String, dynamic> json) {
    return Product(
        key: key,
        name: json['name'],
        quantity: json['cntd'],
        price: json['precio']);
  }
}
