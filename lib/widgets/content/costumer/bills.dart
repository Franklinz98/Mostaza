import 'package:flutter/material.dart';
import 'package:mostaza/backend/costumer.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/models/order.dart';
import 'package:mostaza/models/user.dart';
import 'package:mostaza/widgets/components/bills_item.dart';
import 'package:mostaza/widgets/content/costumer/bill_detail.dart';

class Bills extends StatefulWidget {
  final User user;

  const Bills({Key key, @required this.user}) : super(key: key);

  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  Widget content;

  void _updateView(int k, Order order) {
    setState(() {
      if (k == 0) {
        content = FutureBuilder<List>(
          future: fetchOrders(widget.user.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemBuilder: (_, index) {
                    return BillTile(
                      order: snapshot.data[index],
                      onTap: () {
                        _updateView(1, snapshot.data[index]);
                      },
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              } else if (snapshot.hasError) {
                return Container(
                  color: Colors.red,
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.dixie),
              ),
            );
          },
        );
      } else {
        content = BillDetail(
          order: order,
          onBackPressed: () {
            _updateView(0, null);
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    content = FutureBuilder<List>(
      future: fetchOrders(widget.user.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (_, index) {
                return BillTile(
                  order: snapshot.data[index],
                  onTap: () {
                    _updateView(1, snapshot.data[index]);
                  },
                );
              },
              itemCount: snapshot.data.length,
            );
          } else if (snapshot.hasError) {
            return Container(
              color: Colors.red,
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.dixie),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
