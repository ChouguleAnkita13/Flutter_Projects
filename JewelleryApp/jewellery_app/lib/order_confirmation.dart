import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bitcoin_icons/bitcoin_icons.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm(
      {super.key,required this.selectedOrder});
 final Map selectedOrder;
  @override
  State<OrderConfirm> createState() {
    return _OrderConfirmState();
  }
}
class _OrderConfirmState extends State<OrderConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
        backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
        centerTitle: true,
        title: Text(
          "Order Confirmation",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 18,
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
            const EdgeInsets.only(top: 20, bottom: 10,left: 10,right: 10),
        child:   Column(
          children: [
             Container(
              width: 400,
                height: 300,
                      decoration: BoxDecoration(
                          ),
                      child: Image.asset(
                        widget.selectedOrder['imgs'],
                        fit: BoxFit.cover,
                      ),
                    ),
               Container(
                      
                      child:
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.selectedOrder["name"],
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                          ),
                    const SizedBox(height: 5,),              
                          Row(
                            children: [
                              const Icon(
                                Icons.currency_rupee,
                                size: 23,
                                color: Colors.black,
                                weight: 500,
                              ),
                              Text(
                                '${widget.selectedOrder["price"]}',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    
                    ),
                   
       
          ],
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
