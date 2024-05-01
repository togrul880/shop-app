import 'package:flutter/material.dart';
import 'package:shopapp/datas/mock_data.dart';
import 'package:shopapp/datas/product_model.dart';
import 'package:shopapp/pages/locations_page.dart';
import 'package:shopapp/pages/menu/menu.dart';
import 'package:shopapp/pages/productdetails/product_detail_page.dart';
import 'package:shopapp/pages/products_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<HomePage> {
  String homePageFilter = "all";

  List<ProductModel> selectedFilterProducts() {
    switch (homePageFilter) {
      case "all":
        return allProducts;
      case "New":
        return allProducts.where((i) => i.isNew).toList();
      case "Tranding":
        return allProducts.where((i) => i.isTrending).toList();
      default:
        return allProducts;
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        width: 300,
        child: Menu(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            // Menu and location Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    borderRadius: BorderRadius.circular(50),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LocationPage()));
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 215, 226, 228),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.purple[300],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // SearchBar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: SearchBar(
                hintText: 'Search...',
                trailing: <Widget>[Icon(Icons.search)],
              ),
            ),

            // Popular and view all
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 106, 106, 106),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 215, 226, 228)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductsPage()));
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.purple[300],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Products list
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    allProducts.where((i) => i.isPopular).toList().length,
                itemBuilder: (context, index) {
                  return ProductItemForHomePage(
                    imagePath: allProducts
                        .where((i) => i.isPopular)
                        .toList()[index]
                        .picture,
                  );
                },
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        homePageFilter = "all";
                      });
                    },
                    child: Container(
                      width: 80,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: homePageFilter == "all"
                              ? selectedFilterContainerColor
                              : unSelectedFilterContainerColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'All',
                        style: TextStyle(
                          color: homePageFilter == "all"
                              ? selectedFilterTextColor
                              : unSelectedFilterTextColor,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        homePageFilter = "New";
                      });
                    },
                    child: Container(
                      width: 80,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: homePageFilter == "New"
                              ? selectedFilterContainerColor
                              : unSelectedFilterContainerColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'New',
                        style: TextStyle(
                          color: homePageFilter == "New"
                              ? selectedFilterTextColor
                              : unSelectedFilterTextColor,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        homePageFilter = "Tranding";
                      });
                    },
                    child: Container(
                      width: 90,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: homePageFilter == "Tranding"
                              ? selectedFilterContainerColor
                              : unSelectedFilterContainerColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'Tranding',
                        style: TextStyle(
                          color: homePageFilter == "Tranding"
                              ? selectedFilterTextColor
                              : unSelectedFilterTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: selectedFilterProducts().length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: selectedFilterProducts()[index],
                          ),
                        ));
                  },
                  child: ProductItemForHomePage(
                    imagePath: selectedFilterProducts()[index].picture,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProductItemForHomePage extends StatelessWidget {
  const ProductItemForHomePage({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 215, 226, 228),
            borderRadius: BorderRadius.circular(15)),
        child: Image.asset(imagePath));
  }
}
