import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bitcoin_icons/bitcoin_icons.dart';
import 'package:jewellery_app/order_confirmation.dart';

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
        padding:
            const EdgeInsets.only(top: 20, bottom: 10,left: 8),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(widget.prodList.length,(idx){
              return   Container(
              width: 170,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(color: Colors.black)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.prodList[idx]["imgs"]))),
                    child: Image.asset(
                      widget.prodList[idx]["imgs"],
                      fit: BoxFit.cover,
                      height: 200,
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
                  const SizedBox(height: 5,),
            
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
                            setState(() {
                              selectedOrder=widget.prodList[idx];
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>OrderConfirm(selectedOrder:selectedOrder)));
                          },
                          style: TextButton.styleFrom(
                            fixedSize: const Size(160, 35),
                            backgroundColor: const Color.fromRGBO(12, 43, 99, 1),
                            shape: RoundedRectangleBorder(                       
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            "BUY NOW",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 255, 255, 1),
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
                    icon: const Icon(
                      BitcoinIcons.cart_outline,
                      color: Colors.black,
                    )),
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
