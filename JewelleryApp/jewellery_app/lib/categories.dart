import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bitcoin_icons/bitcoin_icons.dart';
import 'package:jewellery_app/products.dart';


class Categories extends StatefulWidget {
  const Categories({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CategoriesState();
  }
  
}
class _CategoriesState extends State<Categories>{
  List prodList=[];
  final List categoriesList = [
    {
      "type": "Necklaces",
      "product": [
        {
          "name": "Temple Necklace",
          "imgs": "assets/Necklaces/necklace1.png",
          "price": 1500,
        },
        {
          "name": "Antique Necklace",
          "imgs": "assets/Necklaces/necklace2.png",
          "price": 1200,
        },
        {
          "name": "Zircon Necklace",
          "imgs": "assets/Necklaces/necklace3.png",
          "price": 1650,
        },
        {
          "name": "Kundan Necklace",
          "imgs": "assets/Necklaces/necklace4.png",
          "price": 1350,
        },
        {
          "name": "Gold Mangalsutra",
          "imgs": "assets/Necklaces/mangalsutra.png",
          "price": 2000,
        },
      ],
    },
    {
      "type": "Rings",
      "product": [
        {
          "name": "Gold Ring",
          "imgs": "assets/Rings/ring1.png",
          "price": 1000,
        },
        {
          "name": "Silver Ring",
          "imgs": "assets/Rings/ring2.png",
          "price": 1200,
        },
        {
          "name": "Zircon Ring",
          "imgs": "assets/Rings/ring3.png",
          "price": 1150,
        },
        {
          "name": "Antique Ring",
          "imgs": "assets/Rings/ring4.png",
          "price": 1500,
        }
      ],
    },
    {
      "type": "Bangles",
      "product": [
        {
          "name": "Gold Bangles",
          "imgs": "assets/Bangles/bangle1.png",
          "price": 12000,
        }, {
          "name": "Silver Bangles",
          "imgs": "assets/Bangles/bangle2.png",
          "price": 12000,
        }
      ],
    },
    {
      "type": "Earings",
      "product": [
        {
          "name": "Antique Earing",
          "imgs": "assets/Earings/earing1.png",
          "price": 1050,
        },
        {
          "name": "Silver Earing",
          "imgs": "assets/Earings/earing2.png",
          "price": 1050,
        }
      ],
    }
  ];
  String selectedType="";
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
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            color: Color.fromRGBO(51, 51, 51, 1),
            size: 24,
          ),
          
          Icon(Icons.favorite_border,
              color: Color.fromRGBO(51, 51, 51, 1), size: 24),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15,right: 15),
        child: ListView.builder(
          itemCount: categoriesList.length,
          itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: (){
              // if(selectedType==""){
                setState(() {
                  selectedType=categoriesList[index]['type'];
                  //selected Product List
                  prodList=categoriesList[index]['product'];
                });
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>ProductList(selectedType:selectedType,prodList:prodList)));
              },
            // },
            child: Container(
              width: 400,
                    decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(10),
            boxShadow:const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                offset: Offset(0, 10),
                blurRadius: 8
              )
            ]
                    ),
            
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Image.asset(categoriesList[index]['product'][0]['imgs'],height: 100,width:100,fit: BoxFit.cover,),
                  const SizedBox(width: 15,),
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
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          // unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          // selectedLabelStyle:const TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.w700) ,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.home_outlined)),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.category_outlined)),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(BitcoinIcons.cart_outline)),
                label: 'Your order'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person_3_outlined)),
                label: 'Profile'),
          ]),
    );
  }
}
