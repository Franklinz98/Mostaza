import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostaza/constants/menu_category.dart';
import 'package:mostaza/constants/number_format.dart';
import 'package:mostaza/models/dish.dart';
import 'package:transparent_image/transparent_image.dart';

class MenuTile extends StatelessWidget {
  final Dish dish;

  const MenuTile({
    Key key,
    @required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _category;
    switch (dish.category) {
      case MenuCategory.breakfast:
        _category = 'Desayuno';
        break;
      case MenuCategory.lunch:
        _category = 'Almuerzo';
        break;
      case MenuCategory.dinner:
        _category = 'Cena';
        break;
      default:
        _category = 'Otro';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
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
        child: Row(
          children: <Widget>[
            Container(
              height: 90.00,
              width: 90.00,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.00),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.memoryNetwork(
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image: this.dish.imgUrl,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      this.dish.name,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      this.dish.description,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.restaurant,
                                size: 16.0,
                              ),
                            ),
                            Text(_category,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.local_offer,
                                size: 16.0,
                              ),
                            ),
                            Text(
                                Formatter.currency
                                    .format(int.parse(this.dish.price)),
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.access_time,
                                size: 16.0,
                              ),
                            ),
                            Text("${this.dish.avgTime} min",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
