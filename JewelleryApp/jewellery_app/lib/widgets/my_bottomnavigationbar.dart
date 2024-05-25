import "package:flutter/material.dart";

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
                  Navigator.of(context).pushNamed("/home");
                },
                icon: const Icon(Icons.home_outlined)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/categories");
                },
                icon: const Icon(Icons.category_outlined)),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/yourOrder");
                },
                icon: const Icon(Icons.shopping_bag_outlined)),
            label: 'Your order',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/addToCart");
                },
                icon: const Icon(Icons.shopping_cart_outlined)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/profile");
                },
                icon: const Icon(Icons.person_3_outlined)),
            label: 'Profile',
          ),
        ]);
  }
}
