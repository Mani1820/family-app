enum invitationStatus {
  pending,
  accepted,
  declined,
}

class FamilyMembersModel {
  final String firstName;
  final String lastName;
  final int age;
  final String dateOfBirth;
  final String gender;
  final String maritalStatus;
  final String email;
  final String phoneNumber;
  final String relationship;
  final invitationStatus status;

  const FamilyMembersModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.dateOfBirth,
    required this.gender,
    required this.maritalStatus,
    required this.email,
    required this.phoneNumber,
    required this.relationship,
    required this.status,
  });
}

  List<FamilyMembersModel> familyMembers = [
  const FamilyMembersModel(
    firstName: 'Arjun',
    lastName: 'Kumar',
    age: 48,
    dateOfBirth: '1977-03-12',
    gender: 'Male',
    maritalStatus: 'Married',
    email: 'arjun.kumar@example.com',
    phoneNumber: '+919876543210',
    relationship: 'Father',
    status: invitationStatus.accepted,
  ),
  const FamilyMembersModel(
    firstName: 'Priya',
    lastName: 'Devi',
    age: 45,
    dateOfBirth: '1980-07-25',
    gender: 'Female',
    maritalStatus: 'Married',
    email: 'priya.devi@example.com',
    phoneNumber: '+919988776655',
    relationship: 'Mother',
    status: invitationStatus.accepted,
  ),
  const FamilyMembersModel(
    firstName: 'Rohan',
    lastName: 'Kumar',
    age: 22,
    dateOfBirth: '2003-11-01',
    gender: 'Male',
    maritalStatus: 'Single',
    email: 'rohan.kumar@example.com',
    phoneNumber: '+919000111222',
    relationship: 'Son',
    status: invitationStatus.pending, 
  ),
  const FamilyMembersModel(
    firstName: 'Anjali',
    lastName: 'Kumar',
    age: 19,
    dateOfBirth: '2006-02-14',
    gender: 'Female',
    maritalStatus: 'Single',
    email: 'anjali.kumar@example.com',
    phoneNumber: '+918765432109',
    relationship: 'Daughter',
    status: invitationStatus.accepted,
  ),
  const FamilyMembersModel(
    firstName: 'Suresh',
    lastName: 'Sharma',
    age: 75,
    dateOfBirth: '1950-09-05',
    gender: 'Male',
    maritalStatus: 'Widowed',
    email: 'suresh.sharma@example.com',
    phoneNumber: '+917654321098',
    relationship: 'Grandfather',
    status: invitationStatus.accepted,
  ),
  const FamilyMembersModel(
    firstName: 'Deepa',
    lastName: 'Sharma',
    age: 72,
    dateOfBirth: '1953-01-20',
    gender: 'Female',
    maritalStatus: 'Married', 
    email: 'deepa.sharma@example.com',
    phoneNumber: '+919123456789',
    relationship: 'Grandmother',
    status: invitationStatus.declined, 
  ),
  const FamilyMembersModel(
    firstName: 'Meena',
    lastName: 'Gupta',
    age: 40,
    dateOfBirth: '1985-06-30',
    gender: 'Female',
    maritalStatus: 'Divorced',
    email: 'meena.gupta@example.com',
    phoneNumber: '+918000999888',
    relationship: 'Aunt',
    status: invitationStatus.pending,
  ),
  const FamilyMembersModel(
    firstName: 'Vikram',
    lastName: 'Singh',
    age: 35,
    dateOfBirth: '1990-04-18',
    gender: 'Male',
    maritalStatus: 'Married',
    email: 'vikram.singh@example.com',
    phoneNumber: '+917000666555',
    relationship: 'Uncle',
    status: invitationStatus.accepted,
  ),
];