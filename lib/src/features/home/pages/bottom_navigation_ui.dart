import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/core/constants/app_text_theme.dart';
import 'package:portfolio/src/features/educational_videos/pages/educational%20_video_list_ui.dart';
import 'package:portfolio/src/features/home/pages/home_ui.dart';

class BottomNavigationUI extends StatefulWidget {
  const BottomNavigationUI({Key? key}) : super(key: key);

  @override
  State<BottomNavigationUI> createState() => _BottomNavigationUIState();
}

class _BottomNavigationUIState extends State<BottomNavigationUI> {

  int _selectedIndex = 0;
  List<Widget> tabItems = [
    const HomeUI(),
    Center(child: Text("Events", style: AppTextTheme.heading1Style,)),
    Center(child: Text("Search", style: AppTextTheme.heading1Style,)),
   const EducationalVideoListUI(),
    Center(child: Text("Settings", style: AppTextTheme.heading1Style,)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.event),
            title: const Text('Events'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Search'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.video_collection_outlined),
            title: const Text('Videos'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
