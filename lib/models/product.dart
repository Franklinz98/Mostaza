import 'package:flutter/foundation.dart';

class Product {
  final String name;
  String quantity;
  final String key;
  final String price;

  Product(
      {@required this.name,
      @required this.quantity,
      @required this.key,
      @required this.price});

  void addUnit() {
    quantity = (int.parse(quantity) + 1).toString();
  }

  void removeUnit() {
    quantity = (int.parse(quantity) - 1).toString();
  }

  factory Product.fromJson(String key, Map<String, dynamic> json) {
    return Product(
        key: key,
        name: json['name'],
        quantity: json['cntd'],
        price: json['precio']);
  }
}
