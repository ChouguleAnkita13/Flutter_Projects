import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/view/screens/products.dart';
import 'package:jewellery_app/view/widgets/homepage.dart';

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
    return Padding(
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
    );
  }
}
