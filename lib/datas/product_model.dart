// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:shopapp/datas/mock_data.dart';

class ProductModel {
  int id;
  String name;
  String details;
  String company;
  String currency;
  String picture;
  String type;
  // String size;
  ColorModel? selectedColor;
  double price;
  bool isNew;
  bool isTrending;
  bool isPopular;

  ProductModel({
    required this.id,
    required this.name,
    required this.details,
    required this.company,
    required this.currency,
    required this.picture,
    required this.type,
    // required this.size,
    this.selectedColor,
    required this.price,
    required this.isNew,
    required this.isTrending,
    required this.isPopular,
  });
}
