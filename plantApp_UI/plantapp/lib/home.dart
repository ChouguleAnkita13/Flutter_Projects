import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:plantapp/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();
  List plantList = [
    {
      "type": "Indoor",
    },
    {
      "type": "Outdoor",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Transform.translate(
                offset: const Offset(0.0, -30.0),
                child: Image.asset("assets/images/Group3.png")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 185,
                      height: 64,
                      child: Text(
                        "Find your favorite plants",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.15),
                              offset: Offset(0, 4),
                              blurRadius: 16.1)
                        ],
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/images/shopping-bag.png",
                        color: const Color.fromRGBO(62, 102, 24, 1),
                        width: 6.67,
                        height: 3.33,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 320,
                  height: 108,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 300,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(204, 231, 185, 1)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 20),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "30% OFF",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "02-23 April",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.6),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 120,
                                  child: Image.asset(
                                    "assets/images/spiderPlant.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 8,
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
                  onDotClicked: (index) {
                    // controller.move(index);
                  },
                ),
                SizedBox(
                  height: 390,
                  child: ListView.separated(
                    itemCount: plantList.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            plantList[index]["type"],
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, idx) {
                                  return Container(
                                    width: 141,
                                    height: 188,
                                    margin: const EdgeInsets.only(
                                        right: 12, top: 10, bottom: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.06),
                                            offset: Offset(0, 7.52),
                                            blurRadius: 18.8)
                                      ],
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DetailScreen()));
                                            },
                                            child: SizedBox(
                                              width: 100,
                                              height: 112,
                                              child: Image.asset(
                                                "assets/images/snakePlant.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Snake Plants",
                                            style: GoogleFonts.dmSans(
                                                textStyle: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        48, 48, 48, 1),
                                                    fontSize: 13.16,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "₹350",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            62, 102, 24, 1),
                                                        fontSize: 16.92,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                              const Spacer(),
                                              Container(
                                                height: 26,
                                                width: 26,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color: const Color.fromRGBO(
                                                        237, 238, 235, 1)),
                                                child: Image.asset(
                                                  "assets/images/shopping-bag.png",
                                                  width: 14,
                                                  height: 14,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return Container(
                        width: 340,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(204, 211, 196, 1),
                                width: 1)),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
