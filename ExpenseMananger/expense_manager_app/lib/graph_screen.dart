import 'package:expense_manager_app/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  List<Color> myColorList = const [
    Color.fromRGBO(0, 174, 91, 0.7),
    Color.fromRGBO(214, 3, 3, 0.7),
    Color.fromRGBO(241, 38, 197, 0.7),
    Color.fromRGBO(0, 148, 255, 0.7),
    Color.fromRGBO(100, 62, 255, 0.7)
  ];
  Map<String, double> data = {
    "Food": 20,
    "Fuel": 10,
    "Entertainment": 30,
    "Medicine": 20,
    "Shopping": 40,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Graphs",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Color.fromRGBO(33, 33, 33, 1),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      drawer: const MyMenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            PieChart(
              dataMap: data,
              animationDuration: const Duration(milliseconds: 2000),
              chartType: ChartType.ring,
              colorList: myColorList,
              // chartRadius: 200,
              ringStrokeWidth: 20,
              centerWidget: Column(
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.currency_rupee_sharp,
                        size: 13,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2550.00",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              chartValuesOptions:
                  const ChartValuesOptions(showChartValues: false),
              legendOptions: LegendOptions(
                legendTextStyle: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                legendPosition: LegendPosition.right,
                // legendShape: BoxShape.circle

                // showLegends: false
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                width: 314,
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.5), width: 0.2),
                  bottom: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.5), width: 0.2),
                )),
                child: SizedBox(
                  width: 284,
                  height: 320,
                  child: ListView.separated(
                    itemCount: 5,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 23,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: myColorList[index % myColorList.length],
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Food",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.currency_rupee_sharp,
                            size: 15,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                          Text(
                            "650.00",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 8,
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 230,
                  height: 24,
                  child: Row(
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.currency_rupee_sharp,
                        size: 15,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2550.00",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
