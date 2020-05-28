import 'package:flutter/material.dart';
import 'package:mostaza/constants/colors.dart';

class Input extends StatefulWidget {
  final String hintText;
  final Function validator;
  final Icon icon;
  final TextInputType inputType;
  final bool obscureText;
  final TextEditingController controller;

  const Input(
      {Key key,
      @required this.hintText,
      @required this.validator,
      @required this.icon,
      @required this.controller,
      this.inputType,
      this.obscureText=false})
      : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 3.00),
            color: Color(0xff000000).withOpacity(0.16),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(8.00),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            icon: widget.icon),
        keyboardType: widget.inputType,
        obscureText: widget.obscureText,
        validator: widget.validator,
        controller: widget.controller,
      ),
    );
  }
}
