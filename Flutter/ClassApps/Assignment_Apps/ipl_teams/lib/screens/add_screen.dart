import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ipl_teams/model/add_model.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jerNoController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();

  final ImagePicker _pickImage = ImagePicker();
  XFile? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Data",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 10),
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(50, 50, 50, 0.2),
          ),
        ),
        backgroundColor: const Color.fromRGBO(79, 145, 205, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                _selectedImage = await _pickImage.pickImage(
                  source: ImageSource.gallery,
                );
                setState(() {});
              },
              child: Container(
                height: 200,
                width: 200,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  shape: BoxShape.circle,
                ),
                child: _selectedImage == null
                    ? Image.network(
                        "https://cdn0.iconfinder.com/data/icons/avatars-6/500/Avatar_boy_man_people_account_player-512.png",
                      )
                    : Image.file(
                        File(_selectedImage!.path),
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Enter Player Name",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: jerNoController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Enter Jersey No.",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: teamNameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Enter Team Name",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.trim().isNotEmpty &&
                    jerNoController.text.trim().isNotEmpty &&
                    teamNameController.text.trim().isNotEmpty &&
                    _selectedImage != null) {
                  String name =
                      "${teamNameController.text.trim()}/${nameController.text.trim()}${DateTime.now()}";

                  await FirebaseStorage.instance.ref().child(name).putFile(
                        File(_selectedImage!.path),
                      );

                  String? url = await FirebaseStorage.instance
                      .ref()
                      .child(name)
                      .getDownloadURL();

                  await FirebaseFirestore.instance.collection("Team-IPL").add(
                        PlayerData(
                          url: url,
                          name: nameController.text.trim(),
                          jerseyNo: int.parse(jerNoController.text.trim()),
                          teamName: teamNameController.text.trim(),
                        ).playerMap(),
                      );

                  _selectedImage = null;
                  url = null;
                  nameController.clear();
                  jerNoController.clear();
                  teamNameController.clear();
                  log("Data Added");
                  setState(() {});
                }
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromRGBO(25, 56, 138, 1),
                ),
              ),
              child: Text(
                "Add Data",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
