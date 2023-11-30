import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/chatstab.dart';
import 'home/exploretab.dart';
import 'home/hometab.dart';
import 'home/profiletab.dart';
import 'home/storiestab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    ChatsTab(),
    StoriesTab(),
    ExploreTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _tabs[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFF3E64FF),
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[200],
          items: [
            _buildBottomNavigationBarItem(Iconsax.home, 0, 'Home'),
            _buildBottomNavigationBarItem(Iconsax.message, 1, 'Chats'),
            _buildBottomNavigationBarItem(Iconsax.story, 2, 'Stories'),
            _buildBottomNavigationBarItem(Iconsax.flash, 3, 'Explore'),
            _buildBottomNavigationBarItem(Iconsax.user, 4, 'Profile'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, int index, String label) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentIndex == index
              ? Color(0xFF8FA3F3)
              : Colors.grey[200],
        ),
        child: Center(
          child: Icon(
            icon,
            size: 24,
            color: Colors.black54,
          ),
        ),
      ),
      label: label,
    );
  }
}
