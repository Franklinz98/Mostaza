import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/app_icons_icons.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/widgets/components/button.dart';

class LandingPage extends StatelessWidget {
  final VoidCallback onCostumer;
  final VoidCallback onStaff;

  const LandingPage(
      {Key key, @required this.onCostumer, @required this.onStaff})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Image.asset(
                'assets/images/logo.png',
                height: 130.0,
                width: 130.0,
                semanticLabel: 'Mostaza',
              ),
            ),
            Text(
              "¡Bienvenido!",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                textStyle: TextStyle(color: Colors.black),
              ),
            ),
            Text(
              "¿Qué deseas hacer?",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 14,
                textStyle: TextStyle(
                  color: AppColors.dusty_gray,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 32.0),
              child: Button(
                height: 52.0,
                color: AppColors.dixie,
                child: Row(
                  children: <Widget>[
                    Icon(
                      AppIcons.person,
                      color: Colors.white,
                      size: 25.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Cliente',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            textStyle: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
                onPressed: this.onCostumer,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 12.0),
              child: Button(
                height: 52.0,
                color: AppColors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      AppIcons.employee_tag,
                      color: Theme.of(context).primaryColor,
                      size: 25.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Empleado',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
                onPressed: this.onStaff,
              ),
            )
          ],
        ),
      ),
    );
  }
}
