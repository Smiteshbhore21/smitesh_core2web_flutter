import 'package:expense_manager/about_screen.dart';
import 'package:expense_manager/category_screen.dart';
import 'package:expense_manager/graph_screen.dart';
import 'package:expense_manager/home_screen_.dart';
import 'package:expense_manager/trash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int selectedDrawer = 0;

class _MainScreenState extends State<MainScreen> {
  int _selectedScreen = 0;
  final List _pages = [
    const HomeScreen(),
    const GraphScreen(),
    const CategoryScreen(),
    const TrashScreen(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDisplay(_selectedScreen),
      body: _pages[_selectedScreen],
      drawer: drawerSideBar(),
    );
  }

  appBarDisplay(int index) {
    if (index == 0) {
      return AppBar(
        title: Row(
          children: [
            Text(
              "November\t\t2024",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
            )
          ],
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 0.5),
          child: Container(
            height: 1,
            color: Colors.black12,
          ),
        ),
      );
    } else if (index == 1) {
      return AppBar(
        title: Text(
          "Graph",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 0.5),
          child: Container(
            height: 1,
            color: Colors.black12,
          ),
        ),
      );
    } else if (index == 2) {
      return AppBar(
        title: Text(
          "Categories",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 0.5),
          child: Container(
            height: 1,
            color: Colors.black12,
          ),
        ),
      );
    } else if (index == 3) {
      return AppBar(
        title: Text(
          "Trash",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 0.5),
          child: Container(
            height: 1,
            color: Colors.black12,
          ),
        ),
      );
    } else if (index == 4) {
      return AppBar(
        title: Text(
          "About Us",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 0.5),
          child: Container(
            height: 1,
            color: Colors.black12,
          ),
        ),
      );
    }
  }

  Widget drawerSideBar() {
    List drawerData = [
      {
        "title": "Transaction",
        "icon": "assets/drawer/transaction_icon.svg",
      },
      {
        "title": "Graphs",
        "icon": "assets/drawer/pieChart_icon.svg",
      },
      {
        "title": "Category",
        "icon": "assets/drawer/category_icon.svg",
      },
      {
        "title": "Trash",
        "icon": "assets/drawer/trash_icon.svg",
      },
      {
        "title": "About Us",
        "icon": "assets/drawer/aboutUs_icon.svg",
      },
    ];
    return Drawer(
      width: (MediaQuery.of(context).size.width / 2) + 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Expense Manager",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Saves all your Transactions",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: drawerData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        _selectedScreen = index;
                        selectedDrawer = index;
                        drawerClickColor(index);
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      right: 30,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: drawerClickColor(index),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          drawerData[index]["icon"],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          drawerData[index]["title"],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: const Color.fromRGBO(14, 161, 125, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Color? drawerClickColor(clickedIndex) {
  if (clickedIndex == selectedDrawer) return Color.fromRGBO(14, 161, 125, 0.15);
  return null;
}
