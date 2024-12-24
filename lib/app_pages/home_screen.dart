import 'package:flutter/material.dart';
import 'package:shopping_app/app_pages/cart_page.dart';
import 'package:shopping_app/app_widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentPage = 1;
  List<Widget> pages = [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: currentPage,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
              ),
        ],
        ),
      ),
    );
  }
}