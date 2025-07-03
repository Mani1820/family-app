import 'package:family_tree/constants/constants.dart';
import 'package:family_tree/screens/Tab/tab_screen.dart';
import 'package:family_tree/utils/common_button.dart';
import 'package:family_tree/utils/common_dropdownbutton.dart';
import 'package:family_tree/utils/common_textfield.dart';
import 'package:family_tree/utils/validators.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../utils/common_textstyles.dart';

class HeadRegisterationScreen extends StatefulWidget {
  const HeadRegisterationScreen({super.key});

  @override
  State<HeadRegisterationScreen> createState() =>
      _HeadRegisterationScreenState();
}

class _HeadRegisterationScreenState extends State<HeadRegisterationScreen> {
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  int totalPages = 3;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController ocupationController = TextEditingController();
  TextEditingController samajNameController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();

  TextEditingController birthdayController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController exactNatureofDutyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController alternativePhoneNumberController =
      TextEditingController();
  TextEditingController landlineNumberController = TextEditingController();
  TextEditingController socialMediaController = TextEditingController();

  TextEditingController flatNumberController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController nativeDistrictController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController nativeStateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  String? selectedGender;
  String? selectedMareitalStatus;

  List<DropdownMenuItem> genderItems = [
    DropdownMenuItem(value: 'male', child: Text('male')),
    DropdownMenuItem(value: 'female', child: Text('female')),
    DropdownMenuItem(value: 'other', child: Text('other')),
  ];

  List<DropdownMenuItem> mareitalItems = [
    DropdownMenuItem(value: 'married', child: Text('married')),
    DropdownMenuItem(value: 'single', child: Text('single')),
    DropdownMenuItem(value: 'divorced', child: Text('divorced')),
  ];

  void nextPage() {
    if (currentPage < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    ocupationController.dispose();
    samajNameController.dispose();
    qualificationController.dispose();

    birthdayController.dispose();
    bloodGroupController.dispose();
    exactNatureofDutyController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    alternativePhoneNumberController.dispose();
    landlineNumberController.dispose();
    socialMediaController.dispose();

    flatNumberController.dispose();
    buildingNameController.dispose();
    streetController.dispose();
    landmarkController.dispose();
    cityController.dispose();
    districtController.dispose();
    nativeDistrictController.dispose();
    stateController.dispose();
    nativeStateController.dispose();
    countryController.dispose();
    pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.headRegistration, style: appBarStyle()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageIndicationRow(),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              allowImplicitScrolling: false,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                _formScreen1(size.height * 0.28),
                _formScreen2(),
                _formScreen3(),
              ],
            ),
          ),
          CommonButton(
            text:
                currentPage == totalPages - 1
                    ? Constants.register
                    : Constants.next,
            onPressed: () {
              if (currentPage == 0) {
                if (formKey1.currentState!.validate() &&
                    selectedGender != null &&
                    selectedMareitalStatus != null) {
                  nextPage();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please fill all required fields in Personal Details.',
                      ),
                    ),
                  );
                }
              } else if (currentPage == 1) {
                if (formKey2.currentState!.validate()) {
                  nextPage();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please fill all required fields in Contact Details.',
                      ),
                    ),
                  );
                }
              } else if (currentPage == 2) {
                if (formKey3.currentState!.validate()) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => TabScreen()),
                    (route) => false,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please fill all required fields in Address Details.',
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget pageIndicationRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          pagenationDots('1', currentPage == 0, Constants.personal),
          pagenationDots('2', currentPage == 1, Constants.contact),
          pagenationDots('3', currentPage == 2, Constants.address),
        ],
      ),
    );
  }

  Widget pagenationDots(String text, bool isActive, String title) {
    return Column(
      children: [
        Divider(thickness: 2, color: Colors.grey),
        AnimatedContainer(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 5),
          duration: Duration(milliseconds: 300),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: isActive ? ColorConstant.primaryColor : Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Text(
            text,
            style: TextStyle(color: isActive ? Colors.white : Colors.black),
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(color: const Color(0xFF333334), fontSize: 12),
        ),
      ],
    );
  }

  Widget _formScreen1(size) {
    return SingleChildScrollView(
      child: Form(
        key: formKey1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: profileContainer(),
            ),
            Text(Constants.personalDetails, style: appBarStyle()),
            CommonTextfield(
              text: Constants.name,
              hintText: 'Enter your name',
              controller: nameController,
              validator: nameValidator,
              keyboardType: TextInputType.name,
            ),
            CommonTextfield(
              text: Constants.age,
              hintText: 'Enter your age',
              keyboardType: TextInputType.number,
              controller: ageController,
              validator: ageValidator,
            ),

            CommonDropdownbutton(
              lable: Constants.gender,
              items: genderItems,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            CommonDropdownbutton(
              lable: Constants.maritalStatus,
              items: mareitalItems,
              onChanged: (value) {
                setState(() {
                  selectedMareitalStatus = value;
                });
              },
            ),
            CommonTextfield(
              text: Constants.ocupation,
              hintText: 'eg. software developer',
              controller: ocupationController,
              validator: occupationValidator,
            ),
            CommonTextfield(
              text: Constants.samajName,
              hintText: 'Enter your samaj name',
              controller: samajNameController,
              validator: samajValidator,
            ),
            CommonTextfield(
              text: Constants.qualification,
              hintText: 'Enter your qualification',
              controller: qualificationController,
              validator: qualificationValidator,
            ),
          ],
        ),
      ),
    );
  }

  Widget profileContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(radius: 60, backgroundColor: Color(0xFFf7e6ed)),
        Text(
          Constants.uploadProfile,
          style: TextStyle(color: ColorConstant.secondaryTextColor),
        ),
      ],
    );
  }

  Widget _formScreen2() {
    return SingleChildScrollView(
      child: Form(
        key: formKey2,
        child: Column(
          children: [
            Text(Constants.personal, style: appBarStyle()),
            CommonTextfield(
              text: Constants.birthDate,
              hintText: 'e.g, 20-02-2025',
              controller: birthdayController,
              validator: birthDateValidator,
            ),
            CommonTextfield(
              text: Constants.bloodGroup,
              hintText: 'Enter your blood group',
              controller: bloodGroupController,
              validator: bloodGroupValidator,
            ),
            CommonTextfield(
              text: Constants.exactNatureofDuty,
              hintText: 'Enter your nature of duty',
              controller: exactNatureofDutyController,
              validator: natureOfDutyValidator,
            ),
            CommonTextfield(
              text: Constants.emailID,
              hintText: 'Enter your email',
              controller: emailController,
              validator: emailValidator,
              keyboardType: TextInputType.emailAddress,
            ),
            CommonTextfield(
              text: Constants.phoneNumber,
              hintText: 'Enter your number',
              keyboardType: TextInputType.number,
              controller: phoneNumberController,
              validator: phoneNumberValidator,
            ),
            CommonTextfield(
              text: Constants.alternativePhoneNumber,
              hintText: 'Enter your number',
              keyboardType: TextInputType.number,
              controller: alternativePhoneNumberController,
              validator: alternativePhoneNumberValidator,
            ),
            CommonTextfield(
              text: Constants.landlineNumber,
              hintText: 'Enter your landline number',
              keyboardType: TextInputType.number,
              controller: landlineNumberController,
              validator: landlineNumberValidator,
            ),
            CommonTextfield(
              text: Constants.socialMedia,
              hintText: 'Enter url',
              keyboardType: TextInputType.url,
              controller: socialMediaController,
              validator: socialMediaLinkValidator,
            ),
          ],
        ),
      ),
    );
  }

  Widget _formScreen3() {
    return SingleChildScrollView(
      child: Form(
        key: formKey3,
        child: Column(
          children: [
            Text(Constants.address, style: appBarStyle()),
            CommonTextfield(
              text: Constants.flatnumber,
              hintText: 'Enter your flat number',
              controller: flatNumberController,
              validator: flatNumberValidator,
              keyboardType: TextInputType.number,
            ),
            CommonTextfield(
              text: Constants.buildingName,
              hintText: 'e.g, 5/70',
              controller: buildingNameController,
              validator: buildingNameValidator,
              keyboardType: TextInputType.numberWithOptions(decimal: false),
            ),
            CommonTextfield(
              text: Constants.street,
              hintText: 'Enter your street',
              controller: streetController,
              validator: streetNameValidator,
            ),
            CommonTextfield(
              text: Constants.landmark,
              hintText: 'Enter nearby lanmark',
              controller: landmarkController,
              validator: landmarkValidator,
            ),
            CommonTextfield(
              text: Constants.city,
              hintText: 'Enter your city',
              controller: cityController,
              validator: cityValidator,
            ),
            CommonTextfield(
              text: Constants.district,
              hintText: 'Enter your district',
              controller: districtController,
              validator: districtValidator,
            ),
            CommonTextfield(
              text: Constants.nativeDistrict,
              hintText: 'Enter your native district',
              controller: nativeDistrictController,
              validator: nativeDistrictValidator,
            ),
            CommonTextfield(
              text: Constants.state,
              hintText: 'Enter your state',
              controller: stateController,
              validator: stateValidator,
            ),
            CommonTextfield(
              text: Constants.nativeState,
              hintText: 'Enter your native state',
              controller: nativeStateController,
              validator: nativeStateValidator,
            ),
            CommonTextfield(
              text: Constants.country,
              hintText: 'Enter your country',
              controller: countryController,
              validator: countryValidator,
            ),
            CommonTextfield(
              text: Constants.pincode,
              hintText: 'Enter your pincode',
              controller: pinCodeController,
              validator: pincodeValidator,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
