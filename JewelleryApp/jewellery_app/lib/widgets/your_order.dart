import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/model/model.dart';

List<YourOrderModel> orderList = [];

class YourOrder extends StatefulWidget {
  const YourOrder({super.key});

  @override
  State<StatefulWidget> createState() {
    return _YourOrderState();
  }
}

class _YourOrderState extends State<YourOrder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
      child: orderList.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_bag_rounded,
                  size: 80,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                const Text(
                  'You havent shop yet.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
                    'Shop Now!',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ))
          : ListView.builder(
              itemCount: orderList.length,
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
                        orderList[index].imgs,
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
                            orderList[index].name,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                          ),
                          Text(
                            'Qty :  ${orderList[index].qty}',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                          ),
                          Text(
                            'Amount : ${orderList[index].amount}',
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
    );
  }
}
