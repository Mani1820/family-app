import 'package:family_tree/constants/color_constants.dart';
import 'package:family_tree/constants/constants.dart';
import 'package:family_tree/utils/sharedpreference_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/common_textstyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Constants.appName, style: appBarStyle()),
        centerTitle: true,
        scrolledUnderElevation: 1,
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: ColorConstant.primaryColor,
              size: 28,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topContainer(),
            _profileContainer(size),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(Constants.quickAction, style: appBarStyle()),
                ),
              ],
            ),
            _quickActions(
              Color(0xffeff6ff),
              Color(0xff2563eb),
              FontAwesomeIcons.userGroup,
              Constants.viewMembers,
              Constants.viewMemberDetails,
              size,
              () {},
            ),
            _quickActions(
              Color(0xfff0fdf4),
              Color(0xff21a852),
              FontAwesomeIcons.userPlus,
              Constants.addMembers,
              Constants.addMemberDetails,
              size,
              () {},
            ),
            _quickActions(
              Color(0xfffaf5ff),
              Color(0xff9333ea),
              FontAwesomeIcons.tree,
              Constants.familyTree,
              Constants.familyTreeDetails,
              size,
              () {},
            ),
            _quickActions(
              Color(0xfffff7ed),
              Color(0xffea580c),
              FontAwesomeIcons.download,
              Constants.export,
              Constants.exportDetails,
              size,
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _topContainer() {
    return Container(
      height: 160,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstant.containerBorder),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _dataContainer(
            ColorConstant.lightPrimaryColor,
            ColorConstant.primaryColor,
            Constants.totalMembers,
            '5',
          ),
          _dataContainer(
            ColorConstant.lightGreenColor,
            ColorConstant.greenColor,
            Constants.recentMember,
            'Mani',
          ),
        ],
      ),
    );
  }

  Widget _dataContainer(
    Color backgroundColor,
    Color foregroundColor,
    String title,
    String content,
  ) {
    return Container(
      height: 120,
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 1, vertical: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: backgroundColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: containerTitle()),
          const SizedBox(height: 10),
          Text(content, style: containerContent(foregroundColor)),
        ],
      ),
    );
  }

  Widget _profileContainer(Size size) {
    final String userName =
        SharedpreferenceUtil.getString('UserName') ?? 'User Name';
    return Container(
      height: size.height * 0.35,
      width: size.width,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD0D2FB)),
        gradient: LinearGradient(
          colors: [Color(0xffdcdef5), Color(0xfffbfbfb)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.primaryColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 24,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'family head',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstant.primaryTextcolor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          _contactRow(Icons.phone, '1234567890'),
          SizedBox(height: 5),
          _contactRow(Icons.mail, 'manikandan@gmail.com'),
          SizedBox(height: 5),
          _contactRow(Icons.location_on, 'Coimbatore'),
        ],
      ),
    );
  }

  Widget _contactRow(IconData icon, String text) {
    return Row(
      spacing: 20,
      children: [
        Icon(icon, color: ColorConstant.primaryColor),
        Text(
          text,
          style: profileContainerTitle(),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _quickActions(
    Color color,
    Color iconColor,
    IconData icon,
    String title,
    String subtitle,
    Size size,
    VoidCallback onTap,
  ) {
    return MouseRegion(
      onEnter:
          (event) => setState(() {
            isHovered = true;
          }),
      onExit:
          (event) => setState(() {
            isHovered = false;
          }),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: size.height * 0.18,
          width: size.width,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color),
            color: color,
            boxShadow:
                isHovered
                    ? [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ]
                    : [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
          ),
          child: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: iconColor, size: 24),
              Text(title, style: quickActionTitile()),
              Text(subtitle, style: quickActionSubTitile()),
            ],
          ),
        ),
      ),
    );
  }
}
