import 'package:family_tree/constants/color_constants.dart';
import 'package:family_tree/utils/common_textstyles.dart';
import 'package:flutter/material.dart';

class CommonDropdownbutton extends StatelessWidget {
  const CommonDropdownbutton({super.key, required this.lable, required this.items, this.onChanged});

  final String lable;
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
              hintText: 'Select Your Gender',
              hintStyle: TextStyle(color: ColorConstant.textfieldHintColor),
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
