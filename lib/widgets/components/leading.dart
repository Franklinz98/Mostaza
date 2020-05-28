import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/colors.dart';

class Leading extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const Leading(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          this.imagePath,
          height: 120.0,
          width: 120.0,
        ),
        Text(
          this.title,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            textStyle: TextStyle(color: Colors.black),
          ),
        ),
        Text(
          this.description,
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            fontSize: 13,
            textStyle: TextStyle(
              color: AppColors.dusty_gray,
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.all(8.0)),
      ],
    );
  }
}
