import 'package:family_tree/constants/color_constants.dart';
import 'package:family_tree/utils/common_textstyles.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield({
    super.key,
    required this.text,
    required this.hintText,
    this.keyboardType,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onTap,
    this.readOnly,
  });
  final String text;
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08,
                vertical: size.width * 0.02,
              ),
              child: Text(text, style: textFieldLable()),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            cursorColor: Colors.blue,
            readOnly: readOnly ?? false,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: textfieldHint(),
              prefixIcon: Icon(prefixIcon),
              suffixIcon: Icon(suffixIcon),

              enabledBorder: OutlineInputBorder(
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
              focusedBorder: OutlineInputBorder(
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
        ),
      ],
    );
  }
}
