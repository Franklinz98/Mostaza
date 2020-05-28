import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/backend/costumer.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/constants/menu_category.dart';
import 'package:mostaza/models/user.dart';
import 'package:mostaza/screens/auth/auth_screen.dart';
import 'package:mostaza/widgets/content/costumer/bills.dart';
import 'package:mostaza/widgets/content/costumer/discounts.dart';
import 'package:mostaza/widgets/content/costumer/drawer.dart';
import 'package:mostaza/widgets/components/header.dart';
import 'package:mostaza/widgets/content/costumer/explore.dart';
import 'package:transparent_image/transparent_image.dart';

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
              /* ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "Reciente",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),
                  lastItem(
                      'https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                      "Ejecutivo de Pollo",
                      "Almuerzo ejecutivo con pollo asado, arroz ranchero, ensalada, granos del día y jugo del día.",
                      "3 de Abril, 2020",
                      "\$ 10.900"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "Destacados",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),
                ],
              ), */
            ),
          ],
        ),
        drawer: CostumerDrawer(
          scaffoldKey: widget._scaffoldKey,
          onTap1: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = MenuExplore(category: MenuCategory.breakfast);
            });
          },
          onTap2: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = MenuExplore(category: MenuCategory.lunch);
            });
          },
          onTap3: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = MenuExplore(category: MenuCategory.dinner);
            });
          },
          onTap4: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = MenuExplore(category: MenuCategory.other);
            });
          },
          onTap5: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = Discounts(user: widget.user);
            });
          },
          onTap6: () {
            widget._scaffoldKey.currentState.openEndDrawer();
            setState(() {
              _content = Bills(user: widget.user);
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
