import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/datas/mock_data.dart';

import '../datas/order_model.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 215, 226, 228),
                      ),
                      child: Icon(
                        Icons.menu,
                        color: Colors.purple[300],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Favourites',
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 3,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ),
            isFavoriteProducts.isEmpty
                ? const Text(
                    "You Dont't Have Any Favourites",
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                : ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: isFavoriteProducts.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // white container as a board
                          Positioned(
                            right: 15,
                            bottom: 10,
                            child: Container(
                              width: 250,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),

                          // Picture
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 215, 226, 228),
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset(
                              isFavoriteProducts[index].picture,
                            ),
                          ),

                          // Left side texts
                          Positioned(
                            left: 210,
                            bottom: 40,
                            child: SizedBox(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    isFavoriteProducts[index].name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text('Color'),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 25),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: isFavoriteProducts[index]
                                              .selectedColor!
                                              .color,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${isFavoriteProducts[index].price.floor()} ${isFavoriteProducts[index].currency}',
                                    style: const TextStyle(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // right side icons
                          Positioned(
                            right: 15,
                            bottom: 28,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFavoriteProducts
                                          .remove(isFavoriteProducts[index]);
                                    });
                                  },
                                  child: SvgPicture.asset(
                                      'assets/images/heart.svg'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // setState(() {
                                    //   isFavoriteProducts
                                    //       .remove(isFavoriteProducts[index]);
                                    // });
                                    var selectedSize = "XS";
                                    var cartItem = OrderModel(
                                      product: isFavoriteProducts[index],
                                      size: selectedSize,
                                      color: isFavoriteProducts[index]
                                          .selectedColor!,
                                      count: 1,
                                    );

                                    var checkOrder = cartItems.any((element) =>
                                        element.product.id ==
                                        cartItem.product.id);
                                    if (checkOrder) {
                                      cartItems
                                          .firstWhere((element) =>
                                              element.product.id ==
                                              cartItem.product.id)
                                          .count += 1;
                                    } else {
                                      cartItems.add(cartItem);
                                    }
                                  },
                                  child: Image.asset(
                                    'assets/images/cart.png',
                                    height: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
