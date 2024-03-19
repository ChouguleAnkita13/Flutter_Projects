import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/model/model.dart';
import 'package:jewellery_app/screens/categories.dart';
import 'package:jewellery_app/screens/homepage.dart';
import 'package:jewellery_app/screens/order_confirmation.dart';
import 'package:jewellery_app/database/database_connection.dart';
import 'package:jewellery_app/screens/profilepage.dart';
import 'package:jewellery_app/screens/wishlist.dart';
import 'package:jewellery_app/screens/your_order.dart';


class ProductList extends StatefulWidget {
  const ProductList(
      {super.key, required this.prodList, required this.selectedType});
  final List prodList;
  final String selectedType;
  @override
  State<StatefulWidget> createState() {
    return _ProductListState();
  }
}
class _ProductListState extends State<ProductList> {
  Map<String,dynamic> selectedOrder ={};
  int selectedwish=-1;
  bool isSelectedWish=false;
  List isSelectedWishList=[];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
        backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
        centerTitle: true,
        title: Text(
          widget.selectedType,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
        ),
        actions:  [
          const Icon(
            Icons.notifications_none_outlined,
            color: Color.fromRGBO(51, 51, 51, 1),
            size: 24,
          ),
          IconButton(
            onPressed: (){    Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=>const WishList()));},
        icon: const Icon(Icons.favorite_border,
                color: Color.fromRGBO(51, 51, 51, 1), size: 24),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10,left: 8),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(widget.prodList.length,(idx){
              //added false in list for toggling logic
              isSelectedWishList.add(false);
              return   Container(
              width: 170,
              height: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(color: Colors.black)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                        setState(() {
                              selectedOrder=widget.prodList[idx];
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                         builder: (context)=>OrderConfirm(selectedOrder:selectedOrder)));
                    },
                    child: SizedBox(
                      child: Image.asset(
                        widget.prodList[idx]["imgs"],
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 6, left: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.prodList[idx]["name"],
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ),
                                
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee,
                              size: 15,
                            ),
                            Text(
                              "${widget.prodList[idx]["price"]}",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                 onPressed: () {
                                    setState(() {
                                      isSelectedWishList[idx] =
                                          !isSelectedWishList[idx];
                                    });
                                    if (isSelectedWishList[idx]) {
//inserted wish in database table
                                      insertWish(WishListModel(
                                          name: widget.prodList[idx]['name'],
                                          imgs: widget.prodList[idx]['imgs'],
                                          price: widget.prodList[idx]['price']));
                                      print("added");
                                    } else {
                                      print("removed");
                                      setState(() {
                                      // deleteWish(widget.prodList[idx]);                                      
                                      });
                                    }
                                  },icon: isSelectedWishList[idx]
                                      ? const Icon(Icons.favorite,
                                          color: Colors.red)
                                      : const Icon(Icons.favorite_border_outlined),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 5,bottom: 5,right: 5),
                      child: TextButton(
                          onPressed: () {
                            
                          },
                          style: TextButton.styleFrom(
                            fixedSize: const Size(160, 35),
                            
                            shape: RoundedRectangleBorder(         
                              side:const BorderSide(color:  Color.fromRGBO(12, 43, 99, 1),width: 2)      ,        
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            "ADD TO Cart",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(12, 43, 99, 1),
                              ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            );
          
            }) 
          
          ),
        ),
      ),
      //     );
      //   })),
      // ),
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
