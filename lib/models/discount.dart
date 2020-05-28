import 'package:flutter/foundation.dart';

class Discount {
  final String key;
  final String quantity;
  final String code;
  final String month;

  const Discount({
    @required this.key,
    @required this.quantity,
    @required this.code,
    @required this.month,
  });

  factory Discount.fromJson(String key, Map<String, dynamic> json) {
    return Discount(
      key: key,
      quantity: json['dct'],
      code: json['code'],
      month: json['mes'],
    );
  }
}
