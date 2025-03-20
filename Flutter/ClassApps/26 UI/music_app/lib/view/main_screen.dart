import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:music_app/view/favorite_screen.dart';
import 'package:music_app/view/profile_screen.dart';
import 'package:music_app/view/search_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;
  final List _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPage],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          currentIndex: _selectedPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
          unselectedItemColor: const Color.fromRGBO(157, 178, 206, 1),
          selectedItemColor: const Color.fromRGBO(230, 154, 21, 1),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/home_page/home_icon.svg",
                color: (_selectedPage == 0)
                    ? const Color.fromRGBO(230, 154, 21, 1)
                    : null,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/home_page/search_icon.svg",
                color: (_selectedPage == 1)
                    ? const Color.fromRGBO(230, 154, 21, 1)
                    : null,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/home_page/fav_icon.svg",
                color: (_selectedPage == 2)
                    ? const Color.fromRGBO(230, 154, 21, 1)
                    : null,
              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/home_page/profile_icon.svg",
                color: (_selectedPage == 3)
                    ? const Color.fromRGBO(230, 154, 21, 1)
                    : null,
              ),
              label: "Profile",
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
        ),
      ),
    );
  }
}
