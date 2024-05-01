// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:shopapp/datas/mock_data.dart';
import 'package:shopapp/datas/product_model.dart';

class OrderModel {
  ProductModel product;
  String size;
  ColorModel color;
  int count;
  OrderModel({
    required this.product,
    required this.size,
    required this.color,
    required this.count,
  });
}
