import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/app_icons_icons.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/widgets/components/drawer_tile.dart';
import 'package:mostaza/widgets/components/header.dart';
import 'package:mostaza/widgets/components/linked_text.dart';

class StaffDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String username;
  final GestureTapCallback onTap1;
  final GestureTapCallback onTap2;
  final GestureTapCallback onTapSignOut;

  const StaffDrawer({
    Key key,
    @required this.scaffoldKey,
    @required this.username,
    @required this.onTap1,
    @required this.onTap2,
    @required this.onTapSignOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Header(
            title: this.username,
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.dixie,
            ),
            onPressed: () {
              this.scaffoldKey.currentState.openEndDrawer();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, bottom: 16.0, top: 42.0),
            child: Text(
              "¡HOLA!",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  textStyle: TextStyle(
                    color: Color(0xff000000),
                  )),
            ),
          ),
          DrawerTile(
              icon: AppIcons.add_circle, title: "Nueva orden", onTap: onTap1),
          DrawerTile(icon: AppIcons.list, title: "Ordenes", onTap: onTap2),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: LinkedText(
                      text: "Política de Privacidad",
                      textStyle: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          textStyle: TextStyle(color: AppColors.dusty_gray)),
                      onTap: () {
                        // TODO privacy politcy
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: LinkedText(
                      text: "Términos & Condiciones",
                      textStyle: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          textStyle: TextStyle(color: AppColors.dusty_gray)),
                      onTap: () {
                        // TODO privacy politcy
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: LinkedText(
                      text: "Ayuda",
                      textStyle: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          textStyle: TextStyle(color: AppColors.dusty_gray)),
                      onTap: () {
                        // TODO privacy politcy
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      "Icons by Icons8.com",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          textStyle: TextStyle(color: AppColors.dusty_gray)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: DrawerTile(
                icon: AppIcons.logout,
                title: "Cerrar sesión",
                onTap: onTapSignOut),
          ),
        ],
      ),
    );
  }
}
