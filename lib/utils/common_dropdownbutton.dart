import 'package:family_tree/constants/color_constants.dart';
import 'package:family_tree/utils/common_textstyles.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CommonDropdownbutton extends StatelessWidget {
  const CommonDropdownbutton({
    super.key,
    required this.lable,
    required this.items,
    this.onChanged,
    required this.hintText,
  });

  final String lable;
  final String hintText;
  final List<DropdownMenuItem> items;
  final ValueChanged<dynamic>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(lable, style: textFieldLable(), textAlign: TextAlign.left),
            ],
          ),
          DropdownButtonFormField(
            items: items,
            onChanged: onChanged,
            isExpanded: true,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstant.textfieldBorderColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstant.textfieldBorderColor,
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: ColorConstant.textfieldHintColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: Constants.appFont,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstant.textfieldBorderColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorConstant.textfieldBorderColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
