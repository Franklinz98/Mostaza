import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/screens/auth/auth_screen.dart';

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
