import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/model/model.dart';
import 'package:jewellery_app/database/database_connection.dart';

List<WishListModel> wishList = [];

class WishList extends StatefulWidget {
  const WishList({super.key});
  @override
  State<StatefulWidget> createState() {
    return _WishListState();
  }
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
        backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
        centerTitle: true,
        title: Text(
          "Your Wishlist",
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
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: (wishList.isEmpty)
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'NO HEARTED ITEMS!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'Tap the heart on products to save them for later',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 114, 109, 109),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(12, 43, 99, 1),
                        foregroundColor: Colors.white,
                        fixedSize: const Size(200, 40)),
                    child: const Text(
                      'START BROWSING',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ))
            : ListView.builder(
                itemCount: wishList.length,
                itemBuilder: ((context, index) {
                  return Container(
                    // width: 400,
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
                          wishList[index].imgs,
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
                              wishList[index].name,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.currency_rupee,
                                  size: 15,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  '${wishList[index].price}',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 180,
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
//deleting from database table
                                      deleteWish(wishList[index]);
                                      wishList.removeAt(index);
                                    });
                                  },
                                  child: Text(
                                    "Remove",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(12, 43, 99, 1)),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
