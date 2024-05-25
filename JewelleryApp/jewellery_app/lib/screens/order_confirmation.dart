import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jewellery_app/database/database_connection.dart';
import 'package:jewellery_app/model/model.dart';
import 'package:jewellery_app/widgets/my_bottomnavigationbar.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key, required this.selectedOrder});
  final Map selectedOrder;
  @override
  State<OrderConfirm> createState() {
    return _OrderConfirmState();
  }
}

class _OrderConfirmState extends State<OrderConfirm> {
  TextEditingController addressController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void showBottomSheet() {
    showModalBottomSheet(
        backgroundColor: const Color.fromRGBO(247, 236, 219, 1),
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                left: 15,
                right: 15,
                //To avoid the keyboard overlap the screen
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Confirm Order",
                  style: GoogleFonts.quicksand(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(12, 43, 99, 1),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text("Delivery Address",
                              style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(0, 0, 0, 1))),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            height: 40,
                            child: TextFormField(
                              controller: addressController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(12, 43, 99, 1),
                                        width: 0.5)),
                              ),
                              cursorColor: const Color.fromRGBO(12, 43, 99, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text("Quantity",
                              style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(0, 0, 0, 1))),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            height: 40,
                            child: TextFormField(
                              controller: quantityController,
                              decoration: const InputDecoration(
                                hintText: "1",
                                hintStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(12, 43, 99, 1),
                                        width: 0.5)),
                              ),
                              cursorColor: const Color.fromRGBO(12, 43, 99, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text("Total Amount",
                              style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(0, 0, 0, 1))),
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color.fromRGBO(12, 43, 99, 1),
                                  width: 0.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Text('${widget.selectedOrder["price"]}',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(0, 0, 0, 1))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
//inserted order in database table
                      insertYourOrder(YourOrderModel(
                          name: widget.selectedOrder["name"],
                          imgs: widget.selectedOrder["imgs"],
                          qty: int.tryParse(quantityController.text)!,
                          amount: widget.selectedOrder["price"] *
                              (int.tryParse(quantityController.text))));

                      Navigator.of(context).pop();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(300, 40),
                    backgroundColor: const Color.fromRGBO(12, 43, 99, 1),
                  ),
                  child: Text(
                    "Confirm",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        });
  }

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
        actions: [
          const Icon(
            Icons.notifications_none_outlined,
            color: Color.fromRGBO(51, 51, 51, 1),
            size: 24,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/wishList");
            },
            icon: const Icon(Icons.favorite_border,
                color: Color.fromRGBO(51, 51, 51, 1), size: 24),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
          child: Column(
            children: [
              Container(
                width: 400,
                height: 300,
                decoration: const BoxDecoration(),
                child: Image.asset(
                  widget.selectedOrder['imgs'],
                  fit: BoxFit.cover,
                ),
              ),
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
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        size: 21,
                        color: Colors.black,
                        weight: 500,
                      ),
                      Text(
                        '${widget.selectedOrder["price"]}',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      "Jewelry, in its myriad forms, epitomizes artistry and expression, ranging from classic diamonds to vibrant gemstones, each piece a testament to culture, creativity, and personal flair, captivating hearts and igniting imaginations worldwide.",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(119, 119, 119, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          showBottomSheet();
                        },
                        style: TextButton.styleFrom(
                          fixedSize: const Size(300, 40),
                          backgroundColor: const Color.fromRGBO(12, 43, 99, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          "BUY NOW",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        )),
                  )
                ],
              ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
