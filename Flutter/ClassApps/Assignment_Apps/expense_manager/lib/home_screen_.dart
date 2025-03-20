import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List expenseList = [
  {
    "title": "Food",
    "description": "Lorem Ipsum is simply dummy text of the ",
    "expense": "650",
    "iconLocation": "assets/food_icon.svg",
    "iconBGCOLOR": const Color.fromRGBO(214, 3, 3, 0.7),
  },
  {
    "title": "Fuel",
    "description": "Lorem Ipsum is simply dummy text of the ",
    "expense": "600",
    "iconLocation": "assets/fuel_icon.svg",
    "iconBGCOLOR": const Color.fromRGBO(0, 148, 255, 0.7),
  },
  {
    "title": "Medicine",
    "description": "Lorem Ipsum is simply dummy text of the ",
    "expense": "500",
    "iconLocation": "assets/medicine_icon.svg",
    "iconBGCOLOR": const Color.fromRGBO(0, 174, 91, 0.7),
  },
  {
    "title": "Entertainment",
    "description": "Lorem Ipsum is simply dummy text of the ",
    "expense": "475",
    "iconLocation": "assets/entertainment_icon.svg",
    "iconBGCOLOR": const Color.fromRGBO(100, 62, 255, 0.7),
  },
  {
    "title": "Shopping",
    "description": "Lorem Ipsum is simply dummy text of the ",
    "expense": "325",
    "iconLocation": "assets/shop_icon.svg",
    "iconBGCOLOR": const Color.fromRGBO(241, 38, 197, 0.7),
  }
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: expenseList.length,
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
                        color: expenseList[index]["iconBGCOLOR"],
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
                                expenseList[index]["title"],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 19,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.remove_circle,
                                color: Color.fromRGBO(246, 113, 49, 1),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                expenseList[index]["expense"],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 19,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                expenseList[index]["description"],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color.fromRGBO(0, 0, 00, 0.8),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "3 June | 11:50 AM",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: const Color.fromRGBO(0, 0, 00, 0.6),
                                ),
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
                  height: 7,
                ),
                Container(
                  height: 1,
                  color: Colors.black12,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addTransaction(context);
        },
        backgroundColor: Colors.white,
        elevation: 3.5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              48,
            ),
          ),
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add_circle_sharp,
              size: 55,
              color: Color.fromRGBO(14, 161, 125, 1),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Add Transaction",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  addTransaction(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 30,
            left: 25,
            right: 25,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Date",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Amount",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Category",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Description",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    alignment: Alignment.center,
                    fixedSize: WidgetStatePropertyAll(
                      Size(100, 50),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(14, 161, 125, 1),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Add",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
