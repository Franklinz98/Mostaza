import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/colors.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;

  const DrawerTile({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 32.0),
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.dixie,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              title,
              style: GoogleFonts.openSans(
                fontSize: 14,
                textStyle: TextStyle(color: Color(0xff000000)),
              ),
            ),
          ),
        ],
      ),
      dense: true,
      onTap: onTap,
    );
  }
}
