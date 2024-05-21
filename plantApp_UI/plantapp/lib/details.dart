import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:plantapp/home.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(62, 102, 24, 1),
                size: 24,
              ),
            ),
          ),
          SizedBox(
            height: 300,
            width: 419,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/snakePlant.png",
                  height: 243,
                  width: 195,
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: const SlideEffect(
                    spacing: 8.0,
                    dotWidth: 8,
                    dotHeight: 8,
                    dotColor: Color.fromRGBO(197, 214, 181, 1),
                    activeDotColor: Color.fromRGBO(62, 102, 24, 1),
                  ),
                  onDotClicked: (index) {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Snake Plants",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  width: 298,
                  child: Text(
                    "Plansts make your life with minimal and happy love the plants more and enjoy life.",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(48, 48, 48, 1),
                            fontSize: 13,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    height: 200,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(118, 152, 75, 1)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 15, right: 10, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/images/height.png",
                                    width: 24,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Height",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1)),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "30cm-40cm",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.6)),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/images/thermometer.png",
                                    height: 34,
                                    width: 34,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Temperature",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1)),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "20’C-25’C",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.6)),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/images/pot.png",
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Pot",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1)),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "Ciramic Pot",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.6)),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.8)),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "₹ 350",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.8)),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Container(
                                width: 150,
                                height: 48,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(103, 133, 74, 1),
                                    borderRadius: BorderRadius.circular(8.06)),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/shopping-bag.png",
                                      height: 19.35,
                                      width: 19.35,
                                      color: const Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Add to cart",
                                      style: GoogleFonts.rubik(
                                          textStyle: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1)),
                                          fontSize: 14.52,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
