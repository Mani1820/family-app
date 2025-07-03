import 'package:family_tree/screens/Tab/export_screen.dart';
import 'package:family_tree/screens/Tab/family_tree.dart';
import 'package:family_tree/screens/Tab/home_screen.dart';
import 'package:family_tree/screens/Tab/members_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> screens = [
    HomeScreen(),
    MembersScreen(),
    FamilyTree(),
    ExportScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context, screens: []);
  }
}
