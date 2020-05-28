import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/screens/auth/auth_screen.dart';
import 'package:mostaza/screens/content/costumer/container.dart';
import 'package:mostaza/screens/content/staff/container.dart';
import 'package:mostaza/screens/content/staff/search.dart';

class MostazaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Mostaza',
      theme: ThemeData(
        primaryColor: AppColors.dixie,
      ),
      home: Auth(),
    );
  }
}
