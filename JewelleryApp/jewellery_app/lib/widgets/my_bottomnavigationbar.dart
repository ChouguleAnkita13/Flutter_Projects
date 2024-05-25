import "package:flutter/material.dart";
import "package:jewellery_app/screens/addtocart.dart";
import "package:jewellery_app/screens/categories.dart";
import "package:jewellery_app/screens/homepage.dart";
import "package:jewellery_app/screens/profilepage.dart";
import "package:jewellery_app/screens/your_order.dart";

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        // unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        // selectedLabelStyle:const TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w700) ,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                  icon: const Icon(Icons.home_outlined)),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Categories()));
                  },
                  icon: const Icon(Icons.category_outlined)),
              label: 'Category'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const YourOrder()));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined)),
              label: 'Your order'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddToCart()));
                  },
                  icon: const Icon(Icons.shopping_cart_outlined)),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
                  },
                  icon: const Icon(Icons.person_3_outlined)),
              label: 'Profile'),
        ]);
  }
}
