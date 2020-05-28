import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mostaza/app/mostaza_app.dart';
import 'package:mostaza/constants/colors.dart';


void main(){
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.dixie,
      statusBarBrightness: Brightness.light
    )
  );
  runApp(MostazaApp());
}