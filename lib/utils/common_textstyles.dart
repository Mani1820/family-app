import 'package:family_tree/constants/color_constants.dart';
import 'package:family_tree/constants/constants.dart';
import 'package:flutter/material.dart';

TextStyle appNameStyle() {
  return const TextStyle(
    color: ColorConstant.primaryTextcolor,
    fontSize: 33,
    fontWeight: FontWeight.w700,
    fontFamily: Constants.appFont,
  );
}

TextStyle appSloganStyle() {
  return const TextStyle(
    color: ColorConstant.secondaryTextColor,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: Constants.appFont,
  );
}

TextStyle textFieldLable() {
  return const TextStyle(
    color: ColorConstant.primaryTextcolor,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: Constants.appFont,
  );
}

TextStyle textfieldHint() {
  return const TextStyle(
    color: ColorConstant.textfieldHintColor,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: Constants.appFont,
  );
}

TextStyle buttonStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: Constants.appFont,
  );
}

TextStyle appBarStyle() {
  return const TextStyle(
    color: ColorConstant.primaryTextcolor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: Constants.appFont,
  );
}