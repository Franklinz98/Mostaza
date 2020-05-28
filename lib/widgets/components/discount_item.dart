import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/number_format.dart';
import 'package:mostaza/models/discount.dart';

class DiscountTile extends StatelessWidget {
  final Discount discount;

  const DiscountTile({
    Key key,
    @required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _month;
    switch (int.parse(discount.month)) {
      case 1:
        _month = "Ene.";
        break;
      case 2:
        _month = "Feb.";
        break;
      case 3:
        _month = "Mar.";
        break;
      case 4:
        _month = "Abr.";
        break;
      case 5:
        _month = "May.";
        break;
      case 6:
        _month = "Jun.";
        break;
      case 7:
        _month = "Jul.";
        break;
      case 8:
        _month = "Ago.";
        break;
      case 9:
        _month = "Sept.";
        break;
      case 10:
        _month = "Oct.";
        break;
      case 11:
        _month = "Nov.";
        break;
      case 12:
        _month = "Dic";
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Cupón de descuento",
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                Formatter.currency.format(int.parse(this.discount.quantity)),
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600, fontSize: 32),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.confirmation_number,
                          size: 16.0,
                        ),
                      ),
                      Text(this.discount.code,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ))
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.event,
                        size: 16.0,
                      ),
                    ),
                    Text(_month,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
