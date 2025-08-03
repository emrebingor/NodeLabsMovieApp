import 'package:node_labs_movie_app/components/bottom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:node_labs_movie_app/screen/home/home_screen.dart';
import 'package:node_labs_movie_app/screen/profile/profile_screen.dart';

final class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

final class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
