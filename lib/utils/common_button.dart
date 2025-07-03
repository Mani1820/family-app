import 'package:family_tree/constants/color_constants.dart';
import 'package:family_tree/utils/common_textstyles.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstant.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: Size(size.width * 0.85, size.height * 0.06),
        ),
        child: Text(text, style: buttonStyle()),
      ),
    );
  }
}
