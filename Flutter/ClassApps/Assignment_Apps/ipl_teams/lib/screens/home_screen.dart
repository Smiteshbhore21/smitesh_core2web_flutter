import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipl_teams/screens/player_screen.dart';
import 'add_screen.dart';

class IPLData extends StatefulWidget {
  const IPLData({super.key});

  @override
  State<IPLData> createState() => _IPLDataState();
}

class _IPLDataState extends State<IPLData> {
  Map colorTeam = {
    "CSK": const Color.fromRGBO(255, 255, 60, 1),
    "MI": const Color.fromRGBO(0, 75, 160, 1),
    "SRH": const Color.fromRGBO(255, 130, 42, 1),
    "RCB": const Color.fromRGBO(236, 28, 36, 1),
    "RR": const Color.fromRGBO(37, 74, 165, 1),
    "KKR": const Color.fromRGBO(46, 8, 84, 1),
    "DC": const Color.fromRGBO(0, 0, 139, 1),
    "KXIP": const Color.fromRGBO(237, 27, 36, 1),
  };

  Map teamLogo = {
    "CSK": "https://wallpapercave.com/wp/wp4166466.jpg",
    "MI": "https://wallpapercave.com/wp/wp5040445.jpg",
    "SRH": "https://wallpapercave.com/wp/wp6848469.jpg",
    "RCB":
        "https://wallpapers.com/images/hd/rcb-1920-x-1080-background-7u1u2yz49xecz5sg.jpg",
    "RR": "https://wallpapercave.com/wp/wp6547608.jpg",
    "KKR": "https://wallpapercave.com/wp/wp2850085.jpg",
    "DC": "https://wallpapercave.com/wp/wp6916588.jpg",
    "KXIP": "https://wallpapercave.com/wp/wp7104600.jpg",
  };
  List fetchedData = [];
  Set uniqTeamsIPL = {};
  List teamsIPL = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("Team-IPL").get();

    fetchedData = response.docs;

    for (int i = 0; i < fetchedData.length; i++) {
      uniqTeamsIPL.add(fetchedData[i].data()["playerTeamName"]);
    }
    teamsIPL = uniqTeamsIPL.toList();
    log("$teamsIPL");
    log("Fetched");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IPL TEAMS",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        leading: const Icon(
          Icons.sports_cricket_outlined,
          size: 30,
          color: Color.fromRGBO(25, 56, 138, 1),
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
      body: ListView.builder(
        itemCount: teamsIPL.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              List teamPlayers = [];
              for (int i = 0; i < fetchedData.length; i++) {
                if (fetchedData[i].data()["playerTeamName"] ==
                    teamsIPL[index]) {
                  teamPlayers.add(fetchedData[i]);
                }
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return TeamPlayerScreen(
                      player: teamPlayers,
                      appBarColor: colorTeam[teamsIPL[index]],
                    );
                  },
                ),
              );
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 25,
              ),
              width: MediaQuery.of(context).size.width,
              height: 215,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    24,
                  ),
                ),
                color: colorTeam[teamsIPL[index]],
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Image.network(
                teamLogo[teamsIPL[index]],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const AddData();
              },
            ),
          );
        },
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Color.fromRGBO(25, 56, 138, 1),
          ),
        ),
        child: Text(
          "Add Player",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
