import 'dart:async';

import 'package:family_tree/constants/color_constants.dart';
import 'package:family_tree/utils/common_button.dart';
import 'package:family_tree/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../constants/constants.dart';
import '../utils/common_textstyles.dart';
import 'head_registeration_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Timer? timer;
  int count = 30;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        count = count - 1;
        if (count == 0) {
          timer.cancel();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: _mainColumn(size),
        ),
      ),
    );
  }

  Widget _mainColumn(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundColor: Color(0xFFf7e6ed),
          child: FlutterLogo(size: 50),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
          child: Text(Constants.verifyMobileNumber, style: appNameStyle()),
        ),
        Text(
          Constants.otpSlogan,
          style: appSloganStyle(),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.width * 0.05),
        _otpField(),
        SizedBox(height: size.width * 0.05),
        CommonButton(
          text: Constants.verify,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HeadRegisterationScreen(),
                ),
                (_) => false,
              );
            }
          },
        ),
        _resendOtp(),
      ],
    );
  }

  Widget _otpField() {
    return Form(
      key: formKey,
      child: Pinput(
        defaultPinTheme: PinTheme(
          width: 56,
          height: 56,

          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        focusedPinTheme: PinTheme(
          width: 65,
          height: 65,

          decoration: BoxDecoration(
            border: Border.all(color: ColorConstant.primaryColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF0F0F0),
                spreadRadius: 5,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 200),
        controller: pinController,
        errorText: 'Please enter valid OTP',
        pinAnimationType: PinAnimationType.scale,
        validator: otpValidator,
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _resendOtp() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: Constants.didntReceiveCode,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          WidgetSpan(
            child: Visibility(
              visible: count > 0,
              child: Text(
                ' Resend in 00:$count',
                style: TextStyle(
                  color: ColorConstant.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          WidgetSpan(
            child: Visibility(
              visible: count == 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    count = 30;
                    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                      setState(() {
                        count = count - 1;
                        if (count == 0) {
                          timer.cancel();
                        }
                      });
                    });
                  });
                },
                child: Text(
                  ' Resend',
                  style: TextStyle(
                    color: ColorConstant.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
