import 'package:flutter/material.dart';
import 'package:shopapp/datas/mock_data.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Line: menu and cart
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
                        'Cart',
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

            // cart Item
            if (cartItems.isNotEmpty)
              Column(
                children: [
                  for (var i = 0; i < cartItems.length; i++)
                    Container(
                      margin: const EdgeInsets.all(24),
                      // padding: const EdgeInsets.all(16),
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 1,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: Image.asset(cartItems[i].product.picture),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cartItems[i].color.colorName),
                                Text(
                                    '${cartItems[i].product.price} ${cartItems[i].product.currency}',
                                    style: TextStyle(
                                      color: Colors.purple[300],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          cartItems[i].count += 1;
                                        });
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                    Text(cartItems[i].count.toString()),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          var checkOrder =
                                              cartItems[i].count > 1;
                                          if (checkOrder) {
                                            cartItems[i].count -= 1;
                                          } else {
                                            cartItems.removeWhere((e) =>
                                                e.product.id ==
                                                cartItems[i].product.id);
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Text(
                                  "Total",
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    '${cartItems[i].count * cartItems[i].product.price} ${cartItems[i].product.currency}',
                                    style: TextStyle(
                                      color: Colors.purple[300],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
