import 'package:flutter/material.dart';

class FamilyTree extends StatefulWidget {
  const FamilyTree({super.key});

  @override
  State<FamilyTree> createState() => _FamilyTreeState();
}

class _FamilyTreeState extends State<FamilyTree> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Family Tree screen"));
  }
}
