import "dart:developer";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmployeeApp(),
    );
  }
}

class EmployeeApp extends StatefulWidget {
  const EmployeeApp({super.key});

  @override
  State<EmployeeApp> createState() => _EmployeeAppState();
}

class _EmployeeAppState extends State<EmployeeApp> {
  TextEditingController empName = TextEditingController();
  TextEditingController empSal = TextEditingController();
  TextEditingController devType = TextEditingController();
  List fetchData = [];
  Map maxSalData = {
    "empName": "No Data",
    "empSal": "NO Data",
    "devType": "No Data",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Data"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: empName,
              decoration: const InputDecoration(
                hintText: "Employee Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: empSal,
              decoration: const InputDecoration(
                hintText: "Employee Salary",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: devType,
              decoration: const InputDecoration(
                hintText: "Employee Dev Type",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (empName.text.trim().isNotEmpty &&
                    empSal.text.trim().isNotEmpty &&
                    devType.text.trim().isNotEmpty) {
                  Map<String, dynamic> data = {
                    "empName": empName.text.trim(),
                    "empSal": int.parse(empSal.text.trim()),
                    "devType": devType.text.trim(),
                  };

                  await FirebaseFirestore.instance
                      .collection("EmployeeDetails")
                      .doc("${empName.text.trim()}${empSal.text.trim()}")
                      .set(data);

                  empName.clear();
                  empSal.clear();
                  devType.clear();
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: const Text(
                  "Add Data",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                maxSalData.clear();
                fetchData.clear();
                QuerySnapshot response = await FirebaseFirestore.instance
                    .collection("EmployeeDetails")
                    .get();
                for (var val in response.docs) {
                  fetchData.add(val.data());
                }
                if (fetchData.isNotEmpty) {
                  int maxValIndex = 0;
                  for (int i = 1; i < fetchData.length; i++) {
                    if (fetchData[maxValIndex]["empSal"] <
                        fetchData[i]["empSal"]) {
                      maxValIndex = i;
                    }
                  }
                  log("$fetchData");
                  maxSalData = fetchData[maxValIndex];
                  setState(() {});
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: const Text(
                  "Get Data",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.lime[100],
              child: Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Name: ",
                        children: [
                          TextSpan(
                            text: maxSalData["empName"],
                          )
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Salary: ",
                        children: [
                          TextSpan(
                            text: maxSalData["empSal"].toString(),
                          )
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Dev Type: ",
                        children: [
                          TextSpan(
                            text: maxSalData["devType"],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
