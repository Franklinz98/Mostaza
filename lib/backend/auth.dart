import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mostaza/models/user.dart';

const String baseUrl = 'salty-sea-14039.herokuapp.com';

Future<User> login(String email, String password) async {
  Uri uri = Uri.https(baseUrl, 'login');
  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    User user = User.fromJson(json.decode(response.body));
    if (user.uid != null) {
      return user;
    } else {
      return Future<User>.error('Failed to login User');
    }
  } else {
    return Future<User>.error('Failed to login User');
  }
}

// SignUp request
Future<User> signUp(
  String email,
  String password,
  String name,
  String doc,
  String address,
  String phone,
) async {
  Uri uri = Uri.https(baseUrl, 'user');
  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'displayName': name,
      'iddoc': doc,
      'address': address,
      'phoneNumber': '+57$phone',
    }),
  );
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else if (response.statusCode == 409) {
    throw Exception(response.body);
  } else {
    throw Exception('Failed to register user');
  }
}
