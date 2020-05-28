import 'package:flutter/foundation.dart';
import 'package:mostaza/constants/user_type.dart';

class User {
  final UserType type;
  final String uid;
  final String email;
  final String displayName;

  User({
    @required this.displayName,
    @required this.email,
    @required this.uid,
    @required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      displayName: json['displayName'],
      email: json['email'],
      uid: json['uid'],
      type: json['tipo'] == 0 ? UserType.costumer : UserType.staff,
    );
  }
}
