import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mostaza/models/discount.dart';
import 'package:mostaza/models/dish.dart';
import 'package:mostaza/models/order.dart';
import 'package:path_provider/path_provider.dart';

const String baseUrl = 'salty-sea-14039.herokuapp.com';

Future<File> fetchBill(String url) async {
  try {
    var data = await http.get(url);
    var bytes = data.bodyBytes;
    var dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/mi_archivo_online.pdf");
    File urlFile = await file.writeAsBytes(bytes);
    return urlFile;
  } catch (e) {
    throw Exception("Error al abrir el archivo");
  }
}

Future<List> fetchMenu() async {
  Uri uri = Uri.https(baseUrl, 'platos');
  final http.Response response = await http.get(
    uri,
  );
  if (response.statusCode == 200) {
    List<Dish> _menu = [];
    Map<String, dynamic> body = json.decode(response.body);
    for (String key in body.keys) {
      var dishJson = body[key];
      _menu.add(
        Dish.fromJson(key, dishJson),
      );
    }
    return _menu;
  } else if (response.statusCode == 401) {
    Map<String, dynamic> body = json.decode(response.body)[0];
    return Future<List>.error('Unauthorized');
  } else {
    throw Exception('Failed to login User');
  }
}

Future<List> fetchDiscounts(String email) async {
  var queryParameters = {
    'email': email,
    'aa': '2020',
  };
  Uri uri = Uri.https(baseUrl, 'userbonos', queryParameters);
  final http.Response response = await http.get(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    List<Discount> _discounts = [];
    Map<String, dynamic> body = json.decode(response.body);
    for (String key in body.keys) {
      var discountJson = body[key];
      _discounts.add(
        Discount.fromJson(key, discountJson),
      );
    }
    return _discounts;
  } else if (response.statusCode == 401) {
    Map<String, dynamic> body = json.decode(response.body)[0];
    return Future<List>.error('Unauthorized');
  } else {
    throw Exception('Failed to login User');
  }
}

Future<List> fetchOrders(String uid) async {
  Uri uri = Uri.https(baseUrl, 'ordenes/2020/5/99');
  final http.Response response = await http.get(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    List<Order> _orders = [];
    Map<String, dynamic> body = json.decode(response.body);
    for (String key in body.keys) {
      var orderJson = body[key];
      _orders.add(
        Order.fromCostumerJson(orderJson),
      );
    }
    return _orders;
  } else if (response.statusCode == 401) {
    Map<String, dynamic> body = json.decode(response.body)[0];
    return Future<List>.error('Unauthorized');
  } else {
    throw Exception('Failed to login User');
  }
}
