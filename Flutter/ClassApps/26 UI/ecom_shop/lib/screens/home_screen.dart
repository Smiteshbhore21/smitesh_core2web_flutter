import 'package:ecom_shop/controller/ecom_data.dart';
import 'package:ecom_shop/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categories = ["All", "Men", "Women", "Kids", "Other"];
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SvgPicture.asset(
            "assets/home_screen_assets/Menu_icon.svg",
            height: 60,
            width: 60,
            fit: BoxFit.none,
          ),
        ),
        actions: [
          SvgPicture.asset(
            "assets/home_screen_assets/Profile_icon.svg",
            height: 60,
            width: 60,
            fit: BoxFit.none,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Explore",
              style: GoogleFonts.imprima(
                fontSize: 36,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "Best trendy collection!",
              style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(121, 119, 128, 1)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                      bottom: 10,
                      right: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                      color: categoriesColor(index),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32),
                      ),
                    ),
                    child: Text(
                      categories[index],
                      style: GoogleFonts.imprima(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color:
                            (_selectedCategory == index) ? Colors.white : null,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: MasonryGridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: Provider.of<EcomData>(context).homeData.length,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 325,
                          width: 150,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      16,
                                    ),
                                  ),
                                  child: Image.asset(
                                    Provider.of<EcomData>(context)
                                        .homeData[index]["productImage"],
                                    fit: BoxFit.cover,
                                    height: 260,
                                    width: 150,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 45,
                                right: 15,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5,
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/home_screen_assets/Bag_icon.svg",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$${Provider.of<EcomData>(context).homeData[index]["productPrice"]}",
                                      style: GoogleFonts.imprima(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      Provider.of<EcomData>(context)
                                          .homeData[index]["productTitle"],
                                      style: GoogleFonts.imprima(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: const Color.fromRGBO(
                                            121, 119, 128, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 255,
                          width: 150,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      16,
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/product_assets/product2.png",
                                    fit: BoxFit.cover,
                                    height: 190,
                                    width: 150,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 45,
                                right: 15,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5,
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/home_screen_assets/Bag_icon.svg",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$325.36",
                                      style: GoogleFonts.imprima(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "Leather Coart",
                                      style: GoogleFonts.imprima(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: const Color.fromRGBO(
                                            121, 119, 128, 1),
                                      ),
                                    ),
                                  ],
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

  Color? categoriesColor(index) {
    if (_selectedCategory == index) {
      return const Color.fromRGBO(255, 122, 0, 1);
    }
    return null;
  }
}
