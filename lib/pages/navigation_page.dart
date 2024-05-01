import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopapp/pages/cart.dart';
import 'package:shopapp/pages/favourites.dart';
import 'package:shopapp/pages/home_page.dart';
import 'package:shopapp/pages/products_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  void onTapitem(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      /// ----- home page ----
      const HomePage(),

      /// ---- product  page---
      const ProductsPage(),

      /// ---- Like  page---
      const Favourites(),

      /// ---- cart  page---
      const Cart(),

      /// ---- settings  page---
      const Center(
        child: Text("Settings pages"),
      ),
    ];

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _selectedIndex == 0
                      ? 'assets/images/home_select.svg'
                      : 'assets/images/home_unselect.svg',
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _selectedIndex == 1
                      ? 'assets/images/shirt_select.svg'
                      : 'assets/images/shirt_unselect.svg',
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _selectedIndex == 2
                      ? 'assets/images/liked_select.svg'
                      : 'assets/images/liked_unselect.svg',
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _selectedIndex == 3
                      ? 'assets/images/cart_select.svg'
                      : 'assets/images/cart_unselect.svg',
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _selectedIndex == 4
                      ? 'assets/images/settings_select.svg'
                      : 'assets/images/settings_unselect.svg',
                ),
                label: ''),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          onTap: onTapitem,
        ),
        body: pages[_selectedIndex]);
  }
}
