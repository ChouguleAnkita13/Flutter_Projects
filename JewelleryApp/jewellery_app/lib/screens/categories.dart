import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/screens/products.dart';
import 'package:jewellery_app/screens/homepage.dart';
import 'package:jewellery_app/widgets/my_bottomnavigationbar.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CategoriesState();
  }
}

class _CategoriesState extends State<Categories> {
  List prodList = [];
  String selectedType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
        backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
        centerTitle: true,
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
        ),
        actions: [
          const Icon(
            Icons.notifications_none_outlined,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          IconButton(
            onPressed: () {
                              Navigator.of(context).pushNamed("/wishList");

            },
            icon: const Icon(Icons.favorite_border,
                color: Color.fromRGBO(51, 51, 51, 1), size: 24),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: ListView.builder(
            itemCount: categoriesList.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedType = categoriesList[index]['type'];
                    //selected Product List
                    prodList = categoriesList[index]['product'];
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductList(
                          selectedType: selectedType, prodList: prodList)));
                },
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            offset: Offset(0, 10),
                            blurRadius: 8)
                      ]),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        categoriesList[index]['product'][2]['imgs'],
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        categoriesList[index]['type'],
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
