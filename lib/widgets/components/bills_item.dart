import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/number_format.dart';
import 'package:mostaza/models/order.dart';

class BillTile extends StatelessWidget {
  final Function onTap;
  final Order order;

  const BillTile({Key key, @required this.order, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
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
          title: Row(
            children: <Widget>[
              Text(
                this.order.date,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Text("Orden No. ${this.order.number}",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    )),
              )
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              Formatter.currency.format(int.parse(this.order.total)),
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  textStyle: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
