String? mobileNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter mobile number';
  } else if (value.length != 10) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String? otpValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter otp';
  }
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter name';
  }
  return null;
}

String? ageValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter age';
  }
  return null;
}

String? occupationValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter occupation';
  }
  return null;
}

String? samajValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter samaj';
  }
  return null;
}

String? qualificationValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter qualification';
  }
  return null;
}

String? birthDateValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter birth date';
  }

  try {
    DateTime.parse(value);
  } catch (e) {
    return 'Please enter a valid date (yyyy-mm-dd)';
  }
  return null;
}

String? bloodGroupValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter blood group';
  }
  return null;
}

String? natureOfDutyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter nature of duty';
  }
  return null;
}

String? emailValidator(String? value) {
  final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (value == null || value.isEmpty) {
    return 'Please enter email';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid email';
  }
  return null;
}

String? phoneNumberValidator(String? value) {
  final regExp = RegExp(r'^[0-9]{10}$');
  if (value == null || value.isEmpty) {
    return 'Please enter phone number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid phone number';
  }
  return null;
}

String? alternativePhoneNumberValidator(String? value) {
  final regExp = RegExp(r'^[0-9]{10}$');
  if (value == null || value.isEmpty) {
    return 'Please enter phone number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid phone number';
  }
  return null;
}

String? landlineNumberValidator(String? value) {
  final regExp = RegExp(r'^[0-9]{10}$');
  if (value == null || value.isEmpty) {
    return 'Please enter phone number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid phone number';
  }
  return null;
}

String? socialMediaLinkValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter social media link';
  }
  return null;
}

String? flatNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter flat number';
  }
  return null;
}

String? buildingNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter building name';
  }
  return null;
}

String? streetNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter street name';
  }
  return null;
}

String? landmarkValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter landmark';
  }
  return null;
}

String? cityValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter city';
  }
  return null;
}

String? districtValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter district';
  }
  return null;
}

String? nativeDistrictValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter native district';
  }
  return null;
}

String? stateValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter state';
  }
  return null;
}

String? nativeStateValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter native state';
  }
  return null;
}

String? countryValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter country';
  }
  return null;
}

String? pincodeValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter pincode';
  } else if (value.length != 6) {
    return 'Please enter valid pincode';
  }
  return null;
}
