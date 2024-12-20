import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/controller/database_connection.dart';
import 'package:jewellery_app/model/model.dart';
import 'package:jewellery_app/view/screens/order_confirmation.dart';

List<AddToCartModel> cartList = [];

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() {
    return _AddToCartState();
  }
}

class _AddToCartState extends State<AddToCart> {
  Map<String, dynamic> selectedOrder = {};

  @override
  Widget build(BuildContext context) {
    return cartList.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 80,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your shopping cart is empty.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/homescreen");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(12, 43, 99, 1),
                      foregroundColor: Colors.white,
                      fixedSize: const Size(200, 40)),
                  child: const Text(
                    'Start Shopping',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )))
        : Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 8),
            child: SingleChildScrollView(
              child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(cartList.length, (idx) {
                    return Container(
                      width: 170,
                      height: 330,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                cartList[idx].imgs,
                                fit: BoxFit.cover,
                                height: 200,
                                width: 170,
                              ),
                              Positioned(
                                top: 5,
                                left: 130,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color.fromRGBO(
                                        254, 254, 254, 0.7),
                                  ),
                                  child: GestureDetector(
                                    //delete cart in database table
                                    onTap: () {
                                      setState(() {
                                        deleteCart(cartList[idx]);
                                        cartList.removeAt(idx);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.cancel_outlined,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 6, left: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartList[idx].name,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.currency_rupee,
                                      size: 15,
                                    ),
                                    Text(
                                      "${cartList[idx].price}",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 5, bottom: 5, right: 5),
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedOrder = {
                                        "name": cartList[idx].name,
                                        "imgs": cartList[idx].imgs,
                                        "price": cartList[idx].price
                                      };
                                    });
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => OrderConfirm(
                                                selectedOrder: selectedOrder)));
                                  },
                                  style: TextButton.styleFrom(
                                    fixedSize: const Size(160, 35),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color.fromRGBO(12, 43, 99, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    "View Cart",
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
                  })),
            ),
          );
  }
}
