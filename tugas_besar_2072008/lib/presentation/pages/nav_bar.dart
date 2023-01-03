import 'package:flutter/material.dart';
import 'package:tugas_besar_2072008/color_palette.dart';
import 'package:tugas_besar_2072008/presentation/pages/history_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/home_view.dart';
import 'package:tugas_besar_2072008/presentation/pages/profile_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _PagesState();
}

class _PagesState extends State<NavBar> {
  int _index = 0;

  final List<Widget> _children = [
    const HomePage(),
    const HistoryView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _children.elementAt(_index),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            selectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: secondaryColor,
            onTap: _onItemTapped,
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
