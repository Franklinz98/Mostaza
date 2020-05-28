import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mostaza/models/discount.dart';
import 'package:mostaza/models/dish.dart';
import 'package:mostaza/models/order.dart';

const String baseUrl = 'salty-sea-14039.herokuapp.com';

Future<List<Dish>> fetchMenu() async {
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
    // Map<String, dynamic> body = json.decode(response.body)[0];
    return Future<List>.error('Unauthorized');
  } else {
    throw Exception('Failed to login User');
  }
}

Future<List> fetchDiscount(String email, String code) async {
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
    Discount discount;
    Map<String, dynamic> body = json.decode(response.body);
    for (String key in body.keys) {
      if (key != "cuid") {
        Discount _discount = Discount.fromJson(key, body[key]);
        if (_discount.code == code) {
          discount = _discount;
        }
      }
    }
    return [discount, body["cuid"]];
  } else if (response.statusCode == 401) {
    // Map<String, dynamic> body = json.decode(response.body)[0];
    return Future<List>.error('Unauthorized');
  } else {
    throw Exception('Failed to login User');
  }
}

Future<List> fetchOrders(String uid) async {
  Uri uri = Uri.https(baseUrl, 'ordenestemp/2020/5/28/$uid');
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
        Order.fromStaffJson(key, orderJson),
      );
    }
    return _orders;
  } else if (response.statusCode == 401) {
    // Map<String, dynamic> body = json.decode(response.body)[0];
    return Future<List>.error('Unauthorized');
  } else {
    throw Exception('Failed to login User');
  }
}

Future<bool> claimDiscount(String uid, Discount discount) async {
  Uri uri = Uri.https(baseUrl, 'claimbono');
  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'uid': uid,
      'bid': discount.key,
      'dct': discount.quantity,
      'aa': '2020',
    }),
  );
  if (response.statusCode == 200) {
    var body = json.decode(response.body)["valido"];
    print(body);
    return body;
  } else if (response.statusCode == 401) {
    Map<String, dynamic> body = json.decode(response.body)[0];
    throw Exception(body['message']);
  } else {
    throw Exception('Failed to login User');
  }
}

Future<bool> createOrder(String uid, Order order) async {
  Uri uri = Uri.https(baseUrl, 'orden/crear');
  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'total': order.total,
      'idcliente': order.costumerUid,
      'nfactura': order.number,
      'descuento': order.discount,
      'email': order.costumerEmail,
      'iddoc': order.costumerId,
      'idmesero': uid,
      'nmesa': order.tableNumber,
      'platos': order.dishesJson(),
      'bonoid': order.discountId,
    }),
  );
  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    return result;
  } else if (response.statusCode == 401) {
    Map<String, dynamic> body = json.decode(response.body)[0];
    throw Exception(body['message']);
  } else {
    throw Exception('Failed to login User');
  }
}

Future<bool> finishOrder(Order order) async {
  Uri uri = Uri.https(baseUrl, 'orden/finalizar');
  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'idorden': order.key,
      'year': "2020",
      'mes': "5",
      'cemail': order.costumerEmail,
      'cancelo': order.total,
      'cambio': "0",
    }),
  );
  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    return result;
  } else if (response.statusCode == 401) {
    Map<String, dynamic> body = json.decode(response.body)[0];
    throw Exception(body['message']);
  } else {
    throw Exception('Failed to login User');
  }
}

Future<bool> cancelOrder(Order order) async {
  Uri uri = Uri.https(baseUrl, 'orden/eliminar');
  final request = http.Request("DELETE", uri);
  request.headers.addAll(
    <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  request.body = jsonEncode(<String, String>{
    'idorden': order.key,
    'year': "2020",
    'mes': "5",
  });
  final response = await request.send();
  if (response.statusCode == 200) {
    var result = await response.stream.bytesToString();
    return result == result;
  } else {
    throw Exception('Failed to login User');
  }
}
