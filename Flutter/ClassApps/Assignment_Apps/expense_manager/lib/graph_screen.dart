import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import 'home_screen_.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  double total = 2550;
  Map<String, double> pieData = {
    "Food": 650.00,
    "Fuel": 600.00,
    "Medicine": 500.00,
    "Entertainment": 475.00,
    "Shopping": 325.00,
  };
  late List<MapEntry<String, double>> displayDetails = pieData.entries.toList();
  List<Color> pieColor = [
    const Color.fromRGBO(214, 3, 3, 0.7),
    const Color.fromRGBO(0, 148, 255, 0.7),
    const Color.fromRGBO(0, 174, 91, 0.7),
    const Color.fromRGBO(100, 62, 255, 0.7),
    const Color.fromRGBO(241, 38, 197, 0.7),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PieChart(
              centerWidget: Column(
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "₹ $total",
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              initialAngleInDegree: 270,
              dataMap: pieData,
              chartType: ChartType.ring,
              ringStrokeWidth: 40,
              colorList: pieColor,
              chartValuesOptions: const ChartValuesOptions(
                showChartValues: false,
                showChartValueBackground: false,
              ),
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width - 50,
            margin: const EdgeInsets.only(
              top: 10,
            ),
            color: const Color.fromRGBO(0, 0, 0, 0.3),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: displayDetails.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: pieColor[index],
                              ),
                              child: SvgPicture.asset(
                                expenseList[index]["iconLocation"],
                                height: 50,
                                width: 50,
                                fit: BoxFit.none,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        displayDetails[index].key,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 19,
                                        ),
                                      ),
                                      const Spacer(),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "₹ ${displayDetails[index].value}",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 19,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 10,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width - 50,
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            color: const Color.fromRGBO(0, 0, 0, 0.3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Total",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
              Text(
                "₹ $total",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
