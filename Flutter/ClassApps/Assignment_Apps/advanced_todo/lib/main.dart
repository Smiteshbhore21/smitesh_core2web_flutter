import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import 'todoModel.dart';
import 'package:intl/intl.dart';

dynamic database;
int setCardID = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await openDatabase(
    join(
      await getDatabasesPath(),
      "todoDB.db",
    ),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
      Create table ToDo(
      CardID INT PRIMARY KEY,
      Title TEXT,
      Description TEXT,
      Date TEXT
      )
      ''');
    },
  );

  runApp(const MyApp());
}

void insertToDB(TodoModel obj) async {
  Database localDB = database;
  await localDB.insert(
    "ToDo",
    obj.todoData(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

void editDB(TodoModel obj) async {
  Database localDB = database;
  await localDB.update(
    "ToDo",
    obj.todoData(),
    where: "CardID = ?",
    whereArgs: [obj.CardID],
  );
}

void todoDeleteFromDB(int id) async {
  Database localDB = database;
  await localDB.delete(
    "ToDo",
    where: "CardID = ?",
    whereArgs: [id],
  );
}

Future<List<Map>> showData() async {
  Database localDB = database;
  return await localDB.query("ToDo");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todo(),
      title: "TODO",
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State createState() => _TodoState();
}

class _TodoState extends State {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController date = TextEditingController();

  List<Map> fetchedData = [];

  void _getDataFromDB() async {
    List<Map> data = await showData();
    fetchedData = data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _getDataFromDB();
    if (fetchedData.isNotEmpty) {
      setCardID = fetchedData[fetchedData.length - 1]["CardID"] + 1;
    }
    print("$setCardID");
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 35,
              bottom: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning",
                  style: GoogleFonts.quicksand(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Smitesh",
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "CREATE TO DO LIST",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: card(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottomSheet(context, -1);
        },
        shape: const CircleBorder(),
        backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
          size: 40,
          weight: 100,
        ),
      ),
    );
  }

  //Card
  Widget card() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25.0,
      ),
      child: ListView.builder(
        itemCount: fetchedData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Slidable(
              endActionPane: ActionPane(
                extentRatio: 0.12,
                motion: const ScrollMotion(),
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          title.text = fetchedData[index]['Title'];
                          desc.text = fetchedData[index]['Description'];
                          date.text = fetchedData[index]['Date'];
                          openBottomSheet(context, index);
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          todoDeleteFromDB(fetchedData[index]['CardID']);
                          setState(() {});
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      blurRadius: 12,
                      offset: Offset(4, 0),
                    ),
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        width: 52,
                        height: 52,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                        child: SvgPicture.asset(
                          "assets/card/img.svg",
                          fit: BoxFit.none,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${fetchedData[index]['Title']}",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 15,
                              ),
                              child: Text(
                                "${fetchedData[index]['Description']}",
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(0, 0, 0, 0.7),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${fetchedData[index]['Date']}",
                              style: GoogleFonts.inter(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(0, 0, 0, 0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void openBottomSheet(BuildContext cnt, int isEdit) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: cnt,
      builder: (cnt) {
        return Padding(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            bottom: MediaQuery.of(cnt).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Create To-Do",
                    style: GoogleFonts.quicksand(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          height: 50,
                          width: 50,
                          color: Colors.white,
                          "assets/card/img.svg",
                        ),
                        const Icon(
                          size: 40,
                          Icons.edit_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "Title",
                style: GoogleFonts.quicksand(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(89, 57, 241, 1),
                ),
              ),
              TextField(
                controller: title,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Description",
                style: GoogleFonts.quicksand(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(89, 57, 241, 1),
                ),
              ),
              TextField(
                controller: desc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Date",
                style: GoogleFonts.quicksand(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(89, 57, 241, 1),
                ),
              ),
              TextField(
                onTap: () async {
                  DateTime? pickDate = await showDatePicker(
                    context: cnt,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2025),
                  );
                  date.text = DateFormat.yMMMd().format(pickDate!);
                  setState(() {});
                },
                controller: date,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Center(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromRGBO(89, 57, 241, 1),
                      ),
                    ),
                    onPressed: () {
                      submitData(cnt, isEdit);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      width: MediaQuery.of(cnt).size.width,
                      child: Text(
                        "Submit",
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void submitData(BuildContext cnt, int isEdit) {
    if (title.text.trim().isNotEmpty &&
        desc.text.trim().isNotEmpty &&
        date.text.trim().isNotEmpty) {
      if (isEdit != -1) {
        TodoModel obj = TodoModel(
          CardID: fetchedData[isEdit]["CardID"],
          title: title.text.trim(),
          desc: desc.text.trim(),
          date: date.text.trim(),
        );
        editDB(obj);
      } else {
        TodoModel obj = TodoModel(
          CardID: setCardID,
          title: title.text.trim(),
          desc: desc.text.trim(),
          date: date.text.trim(),
        );
        insertToDB(obj);
      }
      title.clear();
      desc.clear();
      date.clear();
      Navigator.of(cnt).pop();
      setState(() {});
    }
  }
}
