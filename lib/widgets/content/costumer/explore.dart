import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/backend/costumer.dart';
import 'package:mostaza/constants/colors.dart';
import 'package:mostaza/constants/menu_category.dart';
import 'package:mostaza/models/dish.dart';
import 'package:mostaza/widgets/components/menu_item.dart';

class MenuExplore extends StatefulWidget {
  final MenuCategory category;

  MenuExplore({Key key, @required this.category}) : super(key: key);

  _MenuExploreState createState() => _MenuExploreState();
}

class _MenuExploreState extends State<MenuExplore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: Text(
            "Reciente",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
        Expanded(
            child: FutureBuilder<List>(
          future: fetchMenu(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Dish> menu = _filterMenu(snapshot.data);
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemBuilder: (BuildContext context, int index) {
                    Dish dish = menu[index];
                    return MenuTile(
                      dish: dish,
                    );
                  },
                  itemCount: menu.length,
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
        )),
      ],
    );
  }

  _filterMenu(List menu) {
    if (widget.category == MenuCategory.all) {
      return menu;
    } else {
      List<Dish> filteredMenu = [];
      for (Dish dish in menu) {
        if (dish.category == widget.category) {
          filteredMenu.add(dish);
        }
      }
      return filteredMenu;
    }
  }
}
