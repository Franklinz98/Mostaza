import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/models/product.dart';

class CreateOrderTile extends StatelessWidget {
  final Product product;
  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;

  const CreateOrderTile(
      {Key key,
      @required this.product,
      @required this.onMinusPressed,
      @required this.onPlusPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00, 3.00),
              color: Color(0xff000000).withOpacity(0.16),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(8.00),
        ),
        child: ListTile(
          dense: true,
          leading: Text(
            this.product.quantity,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          title: Text(
            this.product.name,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: AppColors.dixie,
                ),
                onPressed: this.onMinusPressed,
              ),
              IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: AppColors.dixie,
                ),
                onPressed: this.onPlusPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
