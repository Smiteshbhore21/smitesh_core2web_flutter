import 'package:expense_manager/home_screen_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: expenseList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                deleteCategory(context);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      14,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      blurRadius: 8,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      clipBehavior: Clip.antiAlias,
                      height: (MediaQuery.of(context).size.width / 4) - 10,
                      width: (MediaQuery.of(context).size.width / 4) - 10,
                      decoration: BoxDecoration(
                        color: expenseList[index]["iconBGCOLOR"],
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        expenseList[index]["iconLocation"],
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Text(
                      expenseList[index]["title"],
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          padding: const EdgeInsets.only(top: 10),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addCategory(context);
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
              "Add Categories",
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
}

Future<void> deleteCategory(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Delete Category",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Are you sure you want to delete the selected category?",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(14, 161, 125, 1),
                    ),
                  ),
                  child: Text(
                    "Delete",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(150, 138, 138, 0.2),
                    ),
                  ),
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}

Future<void> addCategory(context) {
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
            Center(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 5,
                ),
                width: 85,
                height: 85,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(140, 128, 128, 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.image_outlined,
                  color: Color.fromRGBO(125, 125, 125, 1),
                  size: 35,
                ),
              ),
            ),
            Center(
              child: Text(
                "Add",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Image URL",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter URL",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(33, 33, 33, 1),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Category",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter category name",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(33, 33, 33, 1),
                ),
                border: const OutlineInputBorder(),
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
            ),
          ],
        ),
      );
    },
  );
}
