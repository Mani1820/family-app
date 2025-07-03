import 'package:family_tree/constants/constants.dart';
import 'package:family_tree/screens/otp_screen.dart';
import 'package:family_tree/utils/common_textfield.dart';
import 'package:family_tree/utils/common_textstyles.dart';
import 'package:family_tree/utils/validators.dart';
import 'package:flutter/material.dart';

import '../utils/common_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
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
                child: Text(Constants.appName, style: appNameStyle()),
              ),
              Text(
                Constants.appSlogan,
                style: appSloganStyle(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.width * 0.05),
              Form(
                key: formKey,
                child: CommonTextfield(
                  text: Constants.mobileNumber,
                  hintText: Constants.mobileNumberHint,
                  controller: mobileNumberController,
                  keyboardType: TextInputType.number,
                  validator: mobileNumberValidator,
                ),
              ),

              CommonButton(
                text: Constants.login,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpScreen(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
