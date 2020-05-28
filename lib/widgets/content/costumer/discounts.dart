import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/backend/costumer.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/constants/menu_category.dart';
import 'package:mostaza/models/discount.dart';
import 'package:mostaza/models/dish.dart';
import 'package:mostaza/models/user.dart';
import 'package:mostaza/widgets/components/discount_item.dart';
import 'package:mostaza/widgets/components/menu_item.dart';

class Discounts extends StatefulWidget {
  final User user;

  const Discounts({Key key, @required this.user}) : super(key: key);

  _DiscountsState createState() => _DiscountsState();
}

class _DiscountsState extends State<Discounts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetchDiscounts(widget.user.email),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (BuildContext context, int index) {
                Discount discount = snapshot.data[index];
                return DiscountTile(
                  discount: discount,
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
