import 'package:family_tree/constants/constants.dart';
import 'package:family_tree/model/family_members_model.dart';
import 'package:family_tree/utils/common_button.dart';
import 'package:family_tree/utils/common_dropdownbutton.dart';
import 'package:family_tree/utils/common_textfield.dart';
import 'package:family_tree/utils/common_textstyles.dart';
import 'package:family_tree/utils/validators.dart';
import 'package:flutter/material.dart';

class AddMembersScreen extends StatefulWidget {
  const AddMembersScreen({super.key, required this.onMemberAdded});

  final void Function(FamilyMembersModel member) onMemberAdded;

  @override
  State<AddMembersScreen> createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddMembersScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController agesController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();

  String? selectedGender;
  String? selectedMaritalStatus;
  String? selectedSamajName;

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate != null) {
        dateOfBirthController.text =
            selectedDate.toLocal().toString().split(' ')[0];
      }
    });
  }

  List<DropdownMenuItem> genderList = [
    DropdownMenuItem(value: 'Male', child: Text('Male')),
    DropdownMenuItem(value: 'Female', child: Text('Female')),
    DropdownMenuItem(value: 'Other', child: Text('Other')),
  ];
  List<DropdownMenuItem> maritalStatus = [
    DropdownMenuItem(value: 'Married', child: Text('Married')),
    DropdownMenuItem(value: 'Single', child: Text('Single')),
  ];
  List<DropdownMenuItem> samajName = [
    DropdownMenuItem(value: 'Samaj1', child: Text('Samaj1')),
    DropdownMenuItem(value: 'Samaj2', child: Text('Samaj2')),
    DropdownMenuItem(value: 'Samaj3', child: Text('Samaj3')),
  ];
  void onSave() {
    if (_formKey.currentState!.validate() &&
        selectedGender != null &&
        selectedMaritalStatus != null &&
        selectedSamajName != null) {
      Navigator.of(context).pop();
      widget.onMemberAdded(
        FamilyMembersModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneNumber: mobileNumberController.text,
          email: emailController.text,
          dateOfBirth: dateOfBirthController.text,
          age: int.parse(agesController.text),
          gender: selectedGender.toString(),
          maritalStatus: selectedMaritalStatus.toString(),
          relationship: relationshipController.text,
          samajName: selectedSamajName.toString(),
          status: invitationStatus.pending,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields correctly')),
      );
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    dateOfBirthController.dispose();
    agesController.dispose();
    relationshipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Members', style: appBarStyle()),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CommonTextfield(
                text: Constants.firstName,
                hintText: 'e.g, John',
                controller: firstNameController,
                validator: firstNameValidator,
                keyboardType: TextInputType.name,
              ),
              CommonTextfield(
                text: Constants.lastName,
                hintText: 'e.g, Doe',
                controller: lastNameController,
                validator: lastNameValidator,
                keyboardType: TextInputType.name,
              ),
              CommonTextfield(
                text: Constants.mobileNumber,
                hintText: 'e.g, 9876543210',
                keyboardType: TextInputType.phone,
                controller: mobileNumberController,
                validator: mobileNumberValidator,
              ),
              CommonTextfield(
                text: Constants.email,
                hintText: 'e.g, johndoe.gmail.com',
                controller: emailController,
                validator: emailValidator,
              ),
              CommonTextfield(
                text: Constants.dateOfBirth,
                hintText: 'e.g, 1990-01-01',
                controller: dateOfBirthController,

                validator: birthDateValidator,
                readOnly: true,
                onTap: () => _showDatePicker(context),
              ),
              CommonTextfield(
                text: Constants.ages,
                hintText: 'e.g, 33',
                controller: agesController,
                validator: ageValidator,
                keyboardType: TextInputType.number,
              ),
              CommonDropdownbutton(
                lable: Constants.gender,
                items: genderList,
                hintText: 'Select gender',
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              CommonDropdownbutton(
                lable: Constants.maritalStatus,
                items: maritalStatus,
                hintText: 'Select marital status',
                onChanged: (value) {
                  setState(() {
                    selectedMaritalStatus = value;
                  });
                },
              ),
              CommonTextfield(
                text: Constants.relationship,
                hintText: 'e.g, Husband',
                controller: relationshipController,
                validator: relationValidator,
                keyboardType: TextInputType.name,
              ),
              CommonDropdownbutton(
                lable: Constants.samajName1,
                items: samajName,
                hintText: 'Select Samaj',
                onChanged: (value) {
                  setState(() {
                    selectedSamajName = value;
                  });
                },
              ),
              CommonButton(text: Constants.addMember, onPressed: onSave),
            ],
          ),
        ),
      ),
    );
  }
}
