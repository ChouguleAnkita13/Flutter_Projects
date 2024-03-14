import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bitcoin_icons/bitcoin_icons.dart';
import 'package:jewellery_app/categories.dart';
// import 'package:jewellery_app/products.dart';

class YourOrder extends StatefulWidget {
  const YourOrder({super.key, this.orderList});
  final List? orderList;
  @override
  State<StatefulWidget> createState() {
    return _YourOrderState();
  }
}

class _YourOrderState extends State<YourOrder> {
  @override
  Widget build(BuildContext context) {
    print(widget.orderList!);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
        backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
        centerTitle: true,
        title: Text(
          "Your Orders",
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
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: ListView.builder(
            itemCount: widget.orderList!.length,
            itemBuilder: ((context, index) {
              return Container(
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
                      widget.orderList![index]['imgs'],
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.orderList![index]['name'],
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ),
                        Text(
                          'Qty :  ${widget.orderList![index]['quantity']}',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ),
                        Text(
                          'Amount : ${widget.orderList![index]['famount']}',
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                         builder: (context)=>const Categories()));
                    },
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
