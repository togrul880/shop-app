// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import 'package:shopapp/datas/order_model.dart';
import 'package:shopapp/datas/product_model.dart';

var unSelectedFilterContainerColor = const Color.fromARGB(255, 215, 226, 228);
var selectedFilterContainerColor = Colors.purple[300];

var unSelectedFilterTextColor = Colors.purple[300];
var selectedFilterTextColor = const Color.fromARGB(255, 215, 226, 228);

List<String> homePageFilters = [
  "All",
  "New",
  "Tranding",
];

List<String> productPageFilters = [
  'All',
  'Boys',
  'Girls',
  'Kids',
];

List<List<String>> contactPageMainInfo = [
  ['assets/images/person.png', 'Name'],
  ['assets/images/mail.png', 'Mail'],
  ['assets/images/phone.png', 'Phone Number'],
  ['assets/images/three_dots.png', 'Message'],
];

List<List<String>> contactPageAddtionalInfo = [
  ['assets/images/location.svg', 'Yasamal Rayonu, Sherifzade Street 71'],
  ['assets/images/map.svg', 'Loremipsum.az'],
  ['assets/images/at.svg', 'Loremiipsum@gmail.com'],
  ['assets/images/phone.svg', '+994 50 777 8888'],
];

List<String> productTypes = [
  "kids",
  "boy",
  "girl",
];

List<String> sizeTypes = [
  "XS",
  "S",
  "M",
  "L",
  "XL",
];

class ColorModel {
  String colorName;
  Color color;
  ColorModel({
    required this.colorName,
    required this.color,
  });
}

List<ColorModel> productColors = [
  ColorModel(
    colorName: "Red",
    color: Colors.red,
  ),
  ColorModel(
    colorName: "Yellow",
    color: Colors.yellow,
  ),
  ColorModel(
    colorName: "Blue",
    color: Colors.blue,
  ),
  ColorModel(
    colorName: "Black",
    color: Colors.black,
  ),
];

var allProducts = <ProductModel>[
  ProductModel(
    id: 1,
    name: "Self Love",
    details: lorem(paragraphs: 1, words: 15),
    company: "Zara",
    currency: "AZN",
    picture: "assets/images/selflove_girl.png",
    type: "girl",
    price: 25,
    isNew: true,
    isTrending: false,
    isPopular: true,
  ),
  ProductModel(
    id: 2,
    name: "Good Vibes",
    details: lorem(paragraphs: 1, words: 15),
    company: "Bershka",
    currency: "\$",
    picture: "assets/images/goodvibes_boy.png",
    type: "boy",
    price: 187,
    isNew: false,
    isTrending: true,
    isPopular: true,
  ),
  ProductModel(
    id: 3,
    name: "Open air",
    details: lorem(paragraphs: 1, words: 15),
    company: "GAP",
    currency: "\$",
    picture: "assets/images/openair_girl.png",
    type: "kids",
    price: 36,
    isNew: false,
    isTrending: true,
    isPopular: true,
  ),
  ProductModel(
    id: 4,
    name: 'Communication',
    details: lorem(paragraphs: 1, words: 15),
    company: 'Zara',
    currency: 'AZN',
    picture: "assets/images/communication_boy.png",
    type: 'kids',
    price: 14,
    isNew: true,
    isTrending: false,
    isPopular: true,
  ),
  ProductModel(
    id: 5,
    name: 'Pizza Shirt',
    details: lorem(paragraphs: 1, words: 15),
    company: 'H&M',
    currency: 'AZN',
    picture: 'assets/images/pizzashirt_girl.png',
    type: 'girl',
    price: 28,
    isNew: true,
    isTrending: true,
    isPopular: false,
  ),
  ProductModel(
    id: 6,
    name: 'Cool Alexa',
    details: lorem(paragraphs: 1, words: 16),
    company: 'Amazon',
    currency: 'AZN',
    picture: 'assets/images/coolalexa_boy.png',
    type: 'kids',
    price: 12,
    isNew: false,
    isTrending: true,
    isPopular: false,
  )
];

var isFavoriteProducts = <ProductModel>[];
var cartItems = <OrderModel>[];
