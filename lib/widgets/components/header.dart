import 'package:flutter/material.dart';
import 'package:mostaza/constants/colors.dart';

class Header extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback onPressed;

  Header(
      {Key key,
      @required this.title,
      @required this.icon,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        IconButton(
            icon: this.icon,
            onPressed: this.onPressed),
      ],
    );
  }
}
