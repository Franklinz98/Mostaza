import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/backend/staff.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/models/user.dart';
import 'package:mostaza/widgets/components/orders_item.dart';

class OrderList extends StatefulWidget {
  final User user;

  const OrderList({Key key, @required this.user}) : super(key: key);
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetchOrders(widget.user.email),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              itemBuilder: (_, index) {
                return Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Colors.transparent),
                  child: OrdersTile(
                    order: snapshot.data[index],
                    onRefreshState: () {
                      setState(() {
                        print('pop context');
                        Navigator.pop(context);
                      });
                    },
                  ),
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
}
