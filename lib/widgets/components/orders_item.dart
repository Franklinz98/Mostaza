import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/backend/staff.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/constants/number_format.dart';
import 'package:mostaza/models/order.dart';
import 'package:mostaza/models/product.dart';
import 'package:mostaza/widgets/components/button.dart';

class OrdersTile extends StatelessWidget {
  Order order;
  VoidCallback onRefreshState;

  OrdersTile({Key key, @required this.order, @required this.onRefreshState})
      : super(key: key);

  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            height: 425.00,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.00),
                topRight: Radius.circular(16.00),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "Orden No. ${order.number}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Cliente",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          order.costumerId,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Total",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          Formatter.currency.format(int.parse(order.total)),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Dcto",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          Formatter.currency.format(int.parse(order.discount)),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Productos",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
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
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        itemBuilder: (_, index) {
                          Product product = order.dishes[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  product.quantity,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Expanded(
                                  child: Text(
                                    product.name,
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: order.dishes.length,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Button(
                        height: 38.0,
                        color: AppColors.white,
                        onPressed: () {
                          cancelOrder(order).then(
                            (value) {
                              print('then');
                              print('removed value');
                              this.onRefreshState();
                            },
                          ).catchError(
                            (error) {
                              print('error');
                            },
                          );
                        },
                        child: Text(
                          'Cancelar',
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Button(
                        height: 38.0,
                        color: AppColors.dixie,
                        onPressed: () {
                          finishOrder(order).then(
                            (value) {
                              print('then');
                              print('removed value');
                              this.onRefreshState();
                            },
                          ).catchError(
                            (error) {
                              print('error');
                            },
                          );
                        },
                        child: Text(
                          'Terminar',
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
          leading: Icon(
            Icons.person_outline,
            color: AppColors.dixie,
          ),
          title: Text(
            order.costumerId,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          trailing: new Text(
            order.tableNumber,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color(0xff000000),
            ),
          ),
          onTap: () {
            _showModalBottomSheet(context);
          },
        ),
      ),
    );
  }
}
