import 'package:flutter/material.dart';
import 'package:jewellery_app/screens/categories.dart';
import 'package:jewellery_app/screens/profilepage.dart';
import 'package:jewellery_app/screens/wishlist.dart';
import 'package:jewellery_app/screens/your_order.dart';
import 'package:jewellery_app/screens/products.dart';
import 'package:jewellery_app/database/database_connection.dart';

List<Map<String, dynamic>> categoriesList = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List prodList = [];
  // final List categoriesList = [
  //   {
  //     "type": "Necklaces",
  //     "product": [
  //       {
  //         "name": "Temple Necklace",
  //         "imgs": "assets/Necklaces/necklace1.png",
  //         "price": 1500,
  //       },
  //       {
  //         "name": "Antique Necklace",
  //         "imgs": "assets/Necklaces/necklace2.png",
  //         "price": 1200,
  //       },
  //       {
  //         "name": "Zircon Necklace",
  //         "imgs": "assets/Necklaces/necklace3.png",
  //         "price": 1650,
  //       },
  //       {
  //         "name": "Kundan Necklace",
  //         "imgs": "assets/Necklaces/necklace4.png",
  //         "price": 1350,
  //       },
  //       {
  //         "name": "Gold Mangalsutra",
  //         "imgs": "assets/Necklaces/mangalsutra.png",
  //         "price": 2000,
  //       },
  //     ],
  //   },
  //   {
  //     "type": "Rings",
  //     "product": [
  //       {
  //         "name": "Gold Ring",
  //         "imgs": "assets/Rings/ring1.png",
  //         "price": 1000,
  //       },
  //       {
  //         "name": "Silver Ring",
  //         "imgs": "assets/Rings/ring2.png",
  //         "price": 1200,
  //       },
  //       {
  //         "name": "Zircon Ring",
  //         "imgs": "assets/Rings/ring3.png",
  //         "price": 1150,
  //       },
  //       {
  //         "name": "Antique Ring",
  //         "imgs": "assets/Rings/ring4.png",
  //         "price": 1500,
  //       }
  //     ],
  //   },
  //   {
  //     "type": "Bangles",
  //     "product": [
  //       {
  //         "name": "Gold Bangles",
  //         "imgs": "assets/Bangles/bangle1.png",
  //         "price": 12000,
  //       },
  //       {
  //         "name": "Silver Bangles",
  //         "imgs": "assets/Bangles/bangle2.png",
  //         "price": 12000,
  //       }
  //     ],
  //   },
  //   {
  //     "type": "Earings",
  //     "product": [
  //       {
  //         "name": "Antique Earing",
  //         "imgs": "assets/Earings/earing1.png",
  //         "price": 1050,
  //       },
  //       {
  //         "name": "Silver Earing",
  //         "imgs": "assets/Earings/earing2.png",
  //         "price": 1050,
  //       }
  //     ],
  //   }
  // ];
  String selectedType = "";

  @override
  void initState() {
    super.initState();
    dbConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
          automaticallyImplyLeading: false,
          title: Image.asset(
            "assets/images/logo.png",
            width: 393.72,
            height: 30.62,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined),
              onPressed: () {},
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const WishList()));
              },
              icon: const Icon(Icons.favorite_border,
                  color: Color.fromRGBO(51, 51, 51, 1), size: 24),
            ),
          ]),
      body: ListView(children: [
        Column(
          children: [
            Image.asset(
              "assets/images/home.png",
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesList.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedType =
                                        categoriesList[index]['type'];
                                    prodList = categoriesList[index]['product'];
                                  });
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductList(
                                          selectedType: selectedType,
                                          prodList: prodList)));
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  padding: const EdgeInsets.all(3),
                                  margin: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 209, 131, 15),
                                        width: 1),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                          categoriesList[index]['product'][0]
                                              ['imgs'],
                                          fit: BoxFit.cover)),
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(categoriesList[index]['type']),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/home/img1.png",
                        height: 170,
                        width: 110,
                      )),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/home/img2.png",
                        height: 170,
                        width: 110,
                      )),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/home/img3.png",
                        height: 170,
                        width: 110,
                      )),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/home/img4.png",
                        height: 170,
                        width: 110,
                      )),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/home/img5.png",
                        height: 170,
                        width: 110,
                      )),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/home/img6.png",
                        height: 170,
                        width: 110,
                      )),
                ],
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
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
                    icon: const Icon(Icons.shopping_cart_outlined)),
                label: 'Your order'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                    },
                    icon: const Icon(Icons.person_3_outlined)),
                label: 'Profile'),
          ]),
    );
  }
}
