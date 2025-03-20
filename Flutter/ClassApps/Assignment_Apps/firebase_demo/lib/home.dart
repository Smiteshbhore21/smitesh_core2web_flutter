import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/loginScreen.dart';
import 'package:flutter/material.dart';

class FireBases extends StatefulWidget {
  final String? email;
  const FireBases({super.key, required this.email});

  @override
  State createState() => _FireBaseState(email);
}

class _FireBaseState extends State {
  _FireBaseState(this.email);

  String? email;
  List userData = [];

  TextEditingController name = TextEditingController();
  TextEditingController cmpName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 1, 1, 1),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("$email"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }),
                (Route) {
                  return false;
                },
              );
            },
            child: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: name,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              hintText: "Enter Name",
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 134, 134, 134),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            style: const TextStyle(
              color: Colors.white,
            ),
            controller: cmpName,
            decoration: const InputDecoration(
              hintText: "Enter Company",
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 134, 134, 134),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (name.text.trim().isNotEmpty &&
                  cmpName.text.trim().isNotEmpty) {
                FirebaseFirestore.instance.collection("cmpInfo").add(
                  {
                    "Name": name.text.trim(),
                    "Company": cmpName.text.trim(),
                  },
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Data Added"),
                  ),
                );
                name.clear();
                cmpName.clear();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Data is Invalid"),
                  ),
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 160,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueAccent[100],
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const Text(
                "Add Data",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              userData.clear();
              QuerySnapshot response =
                  await FirebaseFirestore.instance.collection("cmpInfo").get();
              for (var i in response.docs) {
                userData.add(i.data());
              }
              setState(() {});
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 160,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueAccent[100],
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const Text(
                "Get Data",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name : ${userData[index]["Name"]}"),
                        Text("Company : ${userData[index]["Company"]}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
