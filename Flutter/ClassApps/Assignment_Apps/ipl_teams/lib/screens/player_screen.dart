import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamPlayerScreen extends StatefulWidget {
  final List player;
  final Color appBarColor;
  const TeamPlayerScreen({
    required this.player,
    required this.appBarColor,
    super.key,
  });

  @override
  State<TeamPlayerScreen> createState() => _TeamPlayerScreenState();
}

class _TeamPlayerScreenState extends State<TeamPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.player[0].data()["playerTeamName"]} Players",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: widget.appBarColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.player.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 25,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    24,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.all(10),
                    height: 125,
                    width: 125,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                    child: Image.network(
                      widget.player[index].data()["playerPic"],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${widget.player[index].data()["playerName"]}",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 33, 33, 33),
                            ),
                          ),
                          Text(
                            "${widget.player[index].data()["playerJerseyNo"]}",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 33, 33, 33),
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
        },
      ),
    );
  }
}
