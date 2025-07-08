import 'package:family_tree/constants/color_constants.dart';
import 'package:family_tree/constants/constants.dart';
import 'package:family_tree/model/family_members_model.dart';
import 'package:flutter/material.dart';

import '../../utils/common_textstyles.dart';
import '../add_members_screen.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({super.key});

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  @override
  void initState() {
    familyMembers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Members', style: appBarStyle()),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => AddMembersScreen(
                        onMemberAdded: (member) {
                          setState(() {
                            familyMembers.add(member);
                          });
                        },
                      ),
                ),
              );
            },
            icon: Icon(
              Icons.person_add_alt_1_rounded,
              color: ColorConstant.primaryColor,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(Constants.familyHead),
            _buildMemberCard(
              size: size,
              name: 'John Doe',
              relationship: Constants.familyHead,
              status: 'active',
              isHead: true,
              containerbackgroundColor: Colors.white,
            ),
            _buildSectionTitle(Constants.familyMember),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: familyMembers.length,
              itemBuilder: (context, index) {
                final member = familyMembers[index];
                bool isEven = index % 2 == 0;
                return _buildMemberCard(
                  size: size,
                  name: '${member.firstName} ${member.lastName}',
                  relationship: member.relationship,
                  status: member.status,
                  containerbackgroundColor:
                      isEven
                          ? ColorConstant.lightGreenColor
                          : ColorConstant.lightPrimaryColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorConstant.primaryTextcolor,
        ),
      ),
    );
  }

  Widget _buildMemberCard({
    required Size size,
    required String name,
    required String relationship,
    required dynamic status,
    bool isHead = false,
    required Color containerbackgroundColor,
  }) {
    String statusText = '';
    Color backgroundColor = const Color.fromARGB(255, 222, 82, 82);
    Color textColor = Colors.black;

    if (isHead) {
      statusText = 'active';
      backgroundColor = ColorConstant.lightGreenColor;
      textColor = ColorConstant.greenColor;
    } else {
      if (status == invitationStatus.accepted) {
        statusText = 'Accepted';
        backgroundColor = ColorConstant.lightGreenColor;
        textColor = ColorConstant.greenColor;
      } else if (status == invitationStatus.pending) {
        statusText = 'Pending';
        backgroundColor = const Color(0xfffef9c3);
        textColor = const Color(0xffa16207);
      } else {
        statusText = 'Declined';
        backgroundColor = const Color.fromARGB(255, 255, 239, 239);
        textColor = const Color(0xFFF11818);
      }
    }

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: size.height * 0.2,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: containerbackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 215, 215, 215),
              spreadRadius: 3,
              blurRadius: 7,
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xffe8618c),
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorConstant.primaryTextcolor,
                          ),
                        ),
                      ),
                      if (isHead)
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.primaryColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            Constants.familyHead,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    relationship,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorConstant.secondaryTextColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
