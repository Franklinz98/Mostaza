import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/backend/staff.dart';
import 'package:mostaza/constants/app_icons_icons.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/models/dish.dart';
import 'package:mostaza/widgets/components/header.dart';
import 'package:mostaza/widgets/components/input.dart';

class SearchMenu extends StatefulWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Dish> items = [];
  @override
  _SearchMenuState createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {
  List<Dish> filteredItems = List();
  final controllerSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMenu().then((list) {
      widget.items.addAll(list);
      setState(() {
        filteredItems.addAll(widget.items);
      });
    });
    controllerSearch.addListener(_filterlist);
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
              title: 'AGREGAR PRODUCTO',
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.dixie,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Input(
                hintText: 'Nombre del producto',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor ingrese el numero de la mesa';
                  }
                  return null;
                },
                controller: controllerSearch,
                icon: Icon(
                  AppIcons.search,
                  size: 20.0,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                itemBuilder: (_, index) {
                  Dish dish = filteredItems[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                        leading: Icon(
                          AppIcons.lunch,
                          color: AppColors.dusty_gray,
                        ),
                        title: Text(
                          dish.name,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  );
                },
                itemCount: filteredItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _filterlist() {
    String query = controllerSearch.text;
    if (query.isNotEmpty) {
      List<Dish> tempList = [];
      widget.items.forEach((item) {
        if (item.name.contains(controllerSearch.text)) {
          tempList.add(item);
        }
      });
      setState(() {
        filteredItems.clear();
        filteredItems.addAll(tempList);
        tempList.clear();
      });
    } else {
      setState(() {
        filteredItems.clear();
        filteredItems.addAll(widget.items);
      });
    }
  }

  @override
  void dispose() {
    controllerSearch.dispose();
    super.dispose();
  }
}
