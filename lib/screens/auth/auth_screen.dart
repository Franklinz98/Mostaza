import 'package:flutter/material.dart';
import 'package:mostaza/widgets/auth/forgotten_password.dart';
import 'package:mostaza/widgets/auth/landing_page.dart';
import 'package:mostaza/widgets/auth/login.dart';
import 'package:mostaza/widgets/auth/signup.dart';

class Auth extends StatefulWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  Widget content;

  void _updateView(int k, int type) {
    setState(() {
      switch (k) {
        case 1:
          content = Login(
            type: type,
            onBackPressed: () {
              _updateView(0, 0);
            },
            onSignUpShow: () {
              _updateView(2, 0);
            },
            onForgottenShow: () {
              _updateView(3, type);
            },
          );
          break;
        case 2:
          content = SignUp(
            onBackPressed: () {
              _updateView(1, 0);
            },
          );
          break;
        case 3:
          content = Forgotten(
              type: type,
              onBackPressed: () {
                _updateView(1, type);
              });
          break;
        default:
          content = LandingPage(
            onCostumer: () {
              _updateView(1, 0);
            },
            onStaff: () {
              _updateView(1, 1);
            },
          );
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    content = LandingPage(
      onCostumer: () {
        _updateView(1, 0);
      },
      onStaff: () {
        _updateView(1, 1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: widget._scaffoldKey,
        body: content,
      ),
    );
  }
}
