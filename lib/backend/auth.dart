import 'dart:convert';
import 'dart:io';
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
    return User.fromJson(json.decode(response.body));
  } else if (response.statusCode == 401) {
    Map<String, dynamic> body = json.decode(response.body)[0];
    throw Exception(body['message']);
  } else {
    throw Exception('Failed to login User');
  }
}

// SignUp request
Future<User> signUp(
  String email,
  String password,
  String name,
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
      'iddoc': name,
      'address': address,
      'phoneNumber': phone,
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