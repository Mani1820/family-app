import 'package:family_tree/screens/Tab/tab_screen.dart';
// import 'package:family_tree/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      home: TabScreen(),
    );
  }
}
