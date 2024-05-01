import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/datas/mock_data.dart';
import 'package:shopapp/datas/order_model.dart';
import 'package:shopapp/datas/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // Variables
  var selectedSize = "XS";
  var selectedColor = productColors.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Picture
          Stack(
            children: <Widget>[
              // Picture of Product
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(widget.product.picture),
              ),

              // Icons: back and star
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isFavoriteProducts.any(
                              (element) => element.id == widget.product.id)) {
                            isFavoriteProducts.remove(widget.product);
                          } else {
                            widget.product.selectedColor = selectedColor;
                            isFavoriteProducts.add(widget.product);
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: SvgPicture.asset(
                          isFavoriteProducts.any(
                                  (element) => element.id == widget.product.id)
                              ? 'assets/images/liked_select.svg'
                              : 'assets/images/liked_unselect.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Name and price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text('${widget.product.price} ${widget.product.currency}',
                    style: TextStyle(
                      color: Colors.purple[300],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),

          // Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
            child: Text(
              widget.product.details,
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),

          // Size and color section
          Container(
            height: 200,
            padding:
                const EdgeInsets.only(left: 45, top: 10, right: 45, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sizes
                const Text(
                  'Choose size',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var i = 0; i < sizeTypes.length; i++)
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedSize = sizeTypes[i];
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: selectedSize == sizeTypes[i]
                                ? selectedFilterContainerColor
                                : unSelectedFilterContainerColor,
                          ),
                          child: Text(
                            sizeTypes[i],
                            style: TextStyle(
                                color: selectedSize == sizeTypes[i]
                                    ? selectedFilterTextColor
                                    : unSelectedFilterTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ],
                ),
                // Colors
                const Text(
                  'Choose color',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    for (var i = 0; i < productColors.length; i++)
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedColor = productColors[i];
                            widget.product.selectedColor = selectedColor;
                          });
                        },
                        child: Container(
                            margin: const EdgeInsets.only(right: 25),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: productColors[i].color,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Icon(Icons.done,
                                  color: selectedColor == productColors[i]
                                      ? Colors.white
                                      : Colors.transparent),
                            )),
                      ),
                  ],
                )
              ],
            ),
          ),

          // buttons section - buy now and cart
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                width: 160,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 229, 239, 242),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 185, 220, 236),
                      blurRadius: 3,
                      offset: Offset(2, 2), // Shadow position
                    ),
                  ],
                ),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2),
                ),
              ),
              GestureDetector(
                onTap: () {
                  var cartItem = OrderModel(
                    product: widget.product,
                    size: selectedSize,
                    color: selectedColor,
                    count: 1,
                  );

                  var checkOrder = cartItems.any(
                      (element) => element.product.id == cartItem.product.id);
                  if (checkOrder) {
                    cartItems
                        .firstWhere((element) =>
                            element.product.id == cartItem.product.id)
                        .count += 1;
                  } else {
                    cartItems.add(cartItem);
                  }
                },
                child: Image.asset('assets/images/cart.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
