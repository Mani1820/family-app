import 'package:family_tree/constants/color_constants.dart';
import 'package:family_tree/constants/constants.dart';
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
  late PersistentTabController tabController;
  final List<Widget> _screens = [
    HomeScreen(),
    MembersScreen(),
    FamilyTree(),
    ExportScreen(),
  ];
  final List<PersistentBottomNavBarItem> _navBarsItems = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: Constants.home,
      activeColorPrimary: ColorConstant.primaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.group),
      title: Constants.members,
      activeColorPrimary: ColorConstant.primaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.family_restroom),
      title: Constants.familyTree,
      activeColorPrimary: ColorConstant.primaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.download),
      title: Constants.download,
      activeColorPrimary: ColorConstant.primaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
  @override
  void initState() {
    tabController = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _screens,
      items: _navBarsItems,
      controller: tabController,
      navBarStyle: NavBarStyle.style1,
      animationSettings: NavBarAnimationSettings(
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 300),
        ),
      ),
      navBarHeight: 65,
      hideNavigationBarWhenKeyboardAppears: true,
      neumorphicProperties: NeumorphicProperties(bevel: 20),
    );
  }
}
