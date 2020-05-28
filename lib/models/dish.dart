import 'package:flutter/foundation.dart';
import 'package:mostaza/constants/menu_category.dart';

class Dish {
  final String key;
  final String imgUrl;
  final String name;
  final String description;
  final MenuCategory category;
  final String price;
  final String avgTime;

  Dish({
    @required this.key,
    @required this.imgUrl,
    @required this.name,
    @required this.description,
    @required this.category,
    @required this.price,
    @required this.avgTime,
  });

  factory Dish.fromJson(String key, Map<String, dynamic> json) {
    MenuCategory category;
    switch (json['cat']) {
      case 'breakfast':
        category = MenuCategory.breakfast;
        break;
      case 'lunch':
        category = MenuCategory.lunch;
        break;
      case 'dinner':
        category = MenuCategory.dinner;
        break;
      default:
        category = MenuCategory.other;
        break;
    }
    return Dish(
      key: key,
      imgUrl: json['imageUrl'],
      name: json['name'],
      description: json['desc'],
      category: category,
      price: json['precio'],
      avgTime: json['tiempo'],
    );
  }
}
