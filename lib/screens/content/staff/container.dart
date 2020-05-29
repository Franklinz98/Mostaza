import 'package:flutter/material.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/models/user.dart';
import 'package:mostaza/screens/auth/auth_screen.dart';
import 'package:mostaza/widgets/components/header.dart';
import 'package:mostaza/widgets/content/staff/drawer.dart';
import 'package:mostaza/widgets/content/staff/new_order.dart';
import 'package:mostaza/widgets/content/staff/orders.dart';

class StaffContainer extends StatefulWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final User user;

  StaffContainer({Key key, @required this.user}) : super(key: key);
  @override
  _StaffContainerState createState() => _StaffContainerState();
}

class _StaffContainerState extends State<StaffContainer> {
  String _title = "NUEVA ORDEN";
  Widget _content;

  @override
  void initState() {
    super.initState();
    _content = NewOrder(user: widget.user, scaffoldKey: widget._scaffoldKey);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: widget._scaffoldKey,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Header(
                title: _title,
                icon: Icon(
                  Icons.menu,
                  color: AppColors.dixie,
                ),
                onPressed: () {
                  widget._scaffoldKey.currentState.openDrawer();
                },
              ),
              Expanded(
                child: _content,
              ),
            ],
          ),
          drawer: StaffDrawer(
            scaffoldKey: widget._scaffoldKey,
            username: widget.user.displayName,
            onTap1: () {
              widget._scaffoldKey.currentState.openEndDrawer();
              setState(() {
                _content = NewOrder(
                    key: UniqueKey(),
                    user: widget.user,
                    scaffoldKey: widget._scaffoldKey);
                _title = 'NUEVA ORDEN';
              });
            },
            onTap2: () {
              widget._scaffoldKey.currentState.openEndDrawer();
              setState(() {
                _content = OrderList(key: UniqueKey(), user: widget.user);
                _title = 'ORDENES';
              });
            },
            onTapSignOut: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Auth(),
                ),
              );
            },
          )),
    );
  }
}
