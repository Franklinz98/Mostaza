import 'package:flutter/material.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/constants/menu_category.dart';
import 'package:mostaza/models/user.dart';
import 'package:mostaza/screens/auth/auth_screen.dart';
import 'package:mostaza/widgets/content/costumer/bills.dart';
import 'package:mostaza/widgets/content/costumer/discounts.dart';
import 'package:mostaza/widgets/content/costumer/drawer.dart';
import 'package:mostaza/widgets/components/header.dart';
import 'package:mostaza/widgets/content/costumer/explore.dart';

class UserContainer extends StatefulWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final User user;

  UserContainer({Key key, @required this.user}) : super(key: key);

  _UserContainerState createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  String _title = 'EXPLORAR';
  Widget _content;

  @override
  void initState() {
    super.initState();
    _content = MenuExplore(category: MenuCategory.all);
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
                }),
            Expanded(
              child: _content,
            ),
          ],
        ),
        drawer: CostumerDrawer(
          scaffoldKey: widget._scaffoldKey,
          username: widget.user.displayName,
          onTap1: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = MenuExplore(category: MenuCategory.breakfast);
              _title = 'EXPLORAR';
            });
          },
          onTap2: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = MenuExplore(category: MenuCategory.lunch);
              _title = 'EXPLORAR';
            });
          },
          onTap3: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = MenuExplore(category: MenuCategory.dinner);
              _title = 'EXPLORAR';
            });
          },
          onTap4: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = MenuExplore(category: MenuCategory.other);
              _title = 'EXPLORAR';
            });
          },
          onTap5: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = Discounts(user: widget.user);
              _title = 'DESCUENTOS';
            });
          },
          onTap6: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = Bills(user: widget.user);
              _title = 'FACTURAS';
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
        ),
      ),
    );
  }
}
