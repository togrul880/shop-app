import 'package:flutter/material.dart';
import 'package:shopapp/datas/mock_data.dart';
import 'package:shopapp/datas/product_model.dart';
import 'package:shopapp/pages/productdetails/product_detail_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

// Variable for product filter categories
String productPageFilter = 'All';

// Switch case for products
List<ProductModel> selectedFilterProducts() {
  switch (productPageFilter) {
    case 'All':
      return allProducts;
    case 'Boys':
      return allProducts.where((element) => element.type == 'boy').toList();
    case 'Girls':
      return allProducts.where((element) => element.type == 'girl').toList();
    case 'Kids':
      return allProducts.where((element) => element.type == 'kids').toList();

    default:
      return allProducts;
  }
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Search Field
              const Padding(
                padding:
                    EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Searc...',
                  ),
                ),
              ),

              // Row Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < productPageFilters.length; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          productPageFilter = productPageFilters[i];
                        });
                      },
                      child: Container(
                        width: 80,
                        height: 40,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: productPageFilter == productPageFilters[i]
                                ? Colors.purple[300]
                                : const Color.fromARGB(255, 215, 226, 228),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          productPageFilters[i],
                          style: TextStyle(
                              color: productPageFilter == productPageFilters[i]
                                  ? const Color.fromARGB(255, 215, 226, 228)
                                  : Colors.purple[300]),
                        ),
                      ),
                    ),
                ],
              ),

              // Products
              GridView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: selectedFilterProducts().length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisExtent: 300),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                    product: selectedFilterProducts()[index]),
                              ));
                        },
                        child: Image.asset(
                            selectedFilterProducts()[index].picture),
                      ),
                      Text(
                        selectedFilterProducts()[index].name,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '${selectedFilterProducts()[index].price.floor()} ${selectedFilterProducts()[index].currency}',
                        style: const TextStyle(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  );
                },
              ),

              // buttons - sort + filter
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(),
                        ),
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[700],
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(),
                        ),
                        child: Text(
                          'Sort',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[700],
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
