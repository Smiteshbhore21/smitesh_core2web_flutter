import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List studInfo = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  fetchData() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("C2WStudentData").get();

    studInfo = response.docs;
    setState(() {});

    log("${studInfo[0].id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C2W Get Data"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: ListView.builder(
        itemCount: studInfo.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await FirebaseFirestore.instance
                  .collection("C2WStudentData")
                  .doc(studInfo[index].id)
                  .delete();
              studInfo.removeAt(index);
              setState(() {});
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                children: [
                  Text(
                    "Student Name : ${studInfo[index].data()["studName"]}",
                  ),
                  Text(
                    "College Name : ${studInfo[index].data()["collegeName"]}",
                  ),
                  Text(
                    "Enrolled Courses : ${studInfo[index].data()["coursesEnrolled"]}",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
