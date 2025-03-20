import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_nestedmap_stud_info/get_data.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController studNameController = TextEditingController();
  TextEditingController clgNameController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();

  Map enrolledCourses = {};

  bool isOffline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C2W Student Data"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: studNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Your Name",
                ),
                onSubmitted: (value) {
                  enrolledCourses.clear();
                  isOffline = true;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: clgNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Your College Name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 0,
                child: Text(
                  "Enrolled Courses : ${enrolledCourses}",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: courseNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Enrolled Courses",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        (isOffline) ? Colors.blue : Colors.red[100],
                      ),
                    ),
                    onPressed: () {
                      isOffline = true;
                      setState(() {});
                    },
                    child: Text(
                      "Offline",
                      style: TextStyle(
                        color: (isOffline) ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        (!isOffline) ? Colors.blue : Colors.red[100],
                      ),
                    ),
                    onPressed: () {
                      isOffline = false;
                      setState(() {});
                    },
                    child: Text(
                      "Online",
                      style: TextStyle(
                        color: (!isOffline) ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  ),
                  onPressed: () {
                    if (studNameController.text.trim().isNotEmpty &&
                        clgNameController.text.trim().isNotEmpty) {
                      enrolledCourses.addAll({
                        courseNameController.text.trim():
                            (isOffline) ? "Offline" : "Online"
                      });
                      courseNameController.clear();
                      setState(() {});
                    }
                  },
                  child: const Text(
                    "Add Course",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (studNameController.text.trim().isNotEmpty &&
                        clgNameController.text.trim().isNotEmpty) {
                      Map<String, dynamic> data = {
                        "studName": studNameController.text.trim(),
                        "collegeName": clgNameController.text.trim(),
                        "coursesEnrolled": enrolledCourses,
                      };
                      await FirebaseFirestore.instance
                          .collection("C2WStudentData")
                          .add(data);

                      studNameController.clear();
                      clgNameController.clear();
                      enrolledCourses.clear();
                      setState(() {});
                    }
                  },
                  child: const Text(
                    "ADD DATA",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const GetData(),
                      ),
                    );
                  },
                  child: const Text(
                    "GET DATA",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
