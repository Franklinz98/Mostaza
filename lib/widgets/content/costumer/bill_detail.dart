import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/models/order.dart';
import 'package:mostaza/widgets/components/button.dart';

class BillDetail extends StatefulWidget {
  final Order order;
  final Function onBackPressed;

  const BillDetail(
      {Key key, @required this.order, @required this.onBackPressed})
      : super(key: key);

  @override
  _BillDetailState createState() => _BillDetailState();
}

class _BillDetailState extends State<BillDetail> {
  Future<File> futureBill;

  @override
  void initState() {
    super.initState();
    print('as');
    // futureBill = fetchBill(widget.order.billUri);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onBackPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    widget.order.date,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Orden No. ${widget.order.number}",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.00, 3.00),
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                    child: Image.network(widget.order.billUri)),
                /* FutureBuilder<File>(
                  future: futureBill,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return PdfViewer(
                          filePath: snapshot.data.path,
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                    }
                    // By default, show a loading spinner.
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.dixie),
                      ),
                    );
                  },
                ), */
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Button(
                height: 52.0,
                color: AppColors.dixie,
                onPressed: widget.onBackPressed,
                child: Text(
                  'VOLVER',
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textStyle: TextStyle(color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
