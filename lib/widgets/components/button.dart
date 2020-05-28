import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry edgeInsets;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;

  Button(
      {Key key,
      @required this.height,
      @required this.color,
      @required this.child,
      @required this.onPressed,
      this.edgeInsets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      padding: this.edgeInsets,
      decoration: BoxDecoration(
        color: this.color,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 3.00),
            color: Color(0xff000000).withOpacity(0.16),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(8.00),
      ),
      child: FlatButton(
        onPressed: this.onPressed,
        child: this.child,
      ),
    );
  }
}
