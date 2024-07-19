import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/widgets/addtocart.dart';
import 'package:jewellery_app/widgets/categories.dart';
import 'package:jewellery_app/widgets/homepage.dart';
import 'package:jewellery_app/widgets/profilepage.dart';
import 'package:jewellery_app/widgets/your_order.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List labelList = ["Category", "Your order", "Cart", "Profile"];
  static final List<Widget> _widgetOptions = [
    const HomePage(),
    const Categories(),
    const YourOrder(),
    const AddToCart(),
    const ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    log("$_selectedIndex");

    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
          title: _selectedIndex == 0
              ? Image.asset(
                  "assets/images/logo.png",
                  width: 393.72,
                  height: 30.62,
                )
              : Text(
                  labelList[_selectedIndex - 1],
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),
                ),
          centerTitle: true,
          leading: _selectedIndex == 0
              ? IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  icon: const Icon(Icons.arrow_back,
                      color: Color.fromRGBO(51, 51, 51, 1), size: 24),
                ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Color.fromRGBO(51, 51, 51, 1),
                size: 24,
              ),
              onPressed: () {},
            ),
            _selectedIndex == 4
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/wishList");
                    },
                    icon: const Icon(Icons.favorite_border,
                        color: Color.fromRGBO(51, 51, 51, 1), size: 24),
                  ),
          ]),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Your order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: AppTheme.primaryColor,
        selectedIconTheme: const IconThemeData(size: 28),
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(12, 43, 99, 1),
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
