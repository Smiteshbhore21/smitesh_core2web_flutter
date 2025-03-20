import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_shop/controller/ecom_data.dart';
import 'package:ecom_shop/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final int index;
  const DetailsScreen({required this.index, super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int selectedSize = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          textAlign: TextAlign.center,
          style: GoogleFonts.imprima(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        actions: [
          SvgPicture.asset(
            "assets/details_screen_assets/bookmark_icon.svg",
            height: 60,
            width: 60,
            fit: BoxFit.none,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 450,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    40,
                  ),
                ),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 9 / 16,
                  height: MediaQuery.of(context).size.height,
                ),
                items: [
                  Image.asset(
                    Provider.of<EcomData>(context).homeData[widget.index]
                        ["productImage"],
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  Provider.of<EcomData>(context).homeData[widget.index]
                      ["productTitle"],
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    Provider.of<EcomData>(context).homeData[widget.index]
                        ["productImage"],
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    Provider.of<EcomData>(context).homeData[widget.index]
                        ["productImage"],
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    Provider.of<EcomData>(context).homeData[widget.index]
                        ["productImage"],
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Size",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = 0;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedSizeColor(0),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Text(
                      "S",
                      style: GoogleFonts.poppins(
                        color: (selectedSize == 0)
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = 1;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedSizeColor(1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Text(
                      "M",
                      style: GoogleFonts.poppins(
                        color: (selectedSize == 1)
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = 2;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedSizeColor(2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Text(
                      "L",
                      style: GoogleFonts.poppins(
                        color: (selectedSize == 2)
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = 3;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedSizeColor(3),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Text(
                      "XL",
                      style: GoogleFonts.poppins(
                        color: (selectedSize == 3)
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = 4;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedSizeColor(4),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Text(
                      "XXL",
                      style: GoogleFonts.poppins(
                        color: (selectedSize == 4)
                            ? Colors.white
                            : const Color.fromRGBO(121, 119, 128, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${Provider.of<EcomData>(context).homeData[widget.index]["productPrice"]}",
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 160,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(90),
                      ),
                      color: Color.fromRGBO(255, 122, 0, 1),
                    ),
                    child: Text(
                      "Add To Cart",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color? selectedSizeColor(index) {
    if (selectedSize == index) {
      return const Color.fromRGBO(121, 119, 128, 1);
    }
    return null;
  }
}
