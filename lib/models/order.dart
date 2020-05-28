import 'package:flutter/foundation.dart';
import 'package:mostaza/models/product.dart';

class Order {
  final String date;
  final String number;
  final String total;
  final String billUri;
  String key;
  String tableNumber;
  String costumerUid;
  String costumerId;
  String discountId;
  String discount;
  String costumerEmail;
  List<Product> dishes;

  Order(
      {@required this.number,
      @required this.total,
      this.billUri,
      this.key,
      this.date,
      this.tableNumber,
      this.costumerUid,
      this.costumerId,
      this.costumerEmail,
      this.discount,
      this.discountId,
      this.dishes});

  factory Order.fromCostumerJson(Map<String, dynamic> json) {
    String _date =
        "${json["dia"]} de ${_getMonth(json["mes"])} ${json["year"]}";
    return Order(
      date: _date,
      number: json['nfactura'],
      total: json['total'],
      billUri: json['URLfactura'] == null
          ? "https://res.cloudinary.com/lazarod/image/upload/v1590618741/hDoUHqDAxKwgt3XqBACQ.png"
          : json['URLfactura'],
    );
  }

  factory Order.fromStaffJson(String key, Map<String, dynamic> json) {
    List<Product> _items = [];
    Map<String, dynamic> platosJson = json['platos'];
    for (String dishKey in platosJson.keys) {
      _items.add(Product.fromJson(dishKey, platosJson[dishKey]));
    }
    return Order(
      key: key,
      number: json['nfactura'],
      total: json['total'],
      tableNumber: json['nmesa'],
      costumerUid: json['idcliente'],
      costumerId: json['iddoc'],
      costumerEmail: json['email'],
      discount: json['descuento'],
      dishes: _items,
    );
  }

  Map<String, Map<String, String>> dishesJson() {
    final Map<String, Map<String, String>> dishesMap = {};
    for (Product product in dishes) {
      final Map<String, String> dishMap = <String, String>{
        'precio': product.price,
        'name': product.name,
        'cntd': product.quantity,
      };
      dishesMap[product.key] = dishMap;
    }
    return dishesMap;
  }
}

String _getMonth(int month) {
  String _month = "";
  switch (month) {
    case 1:
      _month = "Ene.";
      break;
    case 2:
      _month = "Feb.";
      break;
    case 3:
      _month = "Mar.";
      break;
    case 4:
      _month = "Abr.";
      break;
    case 5:
      _month = "May.";
      break;
    case 6:
      _month = "Jun.";
      break;
    case 7:
      _month = "Jul.";
      break;
    case 8:
      _month = "Ago.";
      break;
    case 9:
      _month = "Sept.";
      break;
    case 10:
      _month = "Oct.";
      break;
    case 11:
      _month = "Nov.";
      break;
    case 12:
      _month = "Dic";
      break;
  }
  return _month;
}
