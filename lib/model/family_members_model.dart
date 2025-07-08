enum invitationStatus { pending, accepted, declined }

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
  final invitationStatus? status;
  final String samajName;

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
    required this.samajName,
  });
}

final List<FamilyMembersModel> familyMembers = [
  FamilyMembersModel(
    firstName: 'Amit',
    lastName: 'Patel',
    age: 45,
    dateOfBirth: '1980-02-15',
    gender: 'Male',
    maritalStatus: 'Married',
    email: 'amit.patel@example.com',
    phoneNumber: '+1-555-123-4567',
    relationship: 'Father',
    status: invitationStatus.accepted,
    samajName: 'Shree Gujarati Samaj',
  ),
  FamilyMembersModel(
    firstName: 'Nisha',
    lastName: 'Patel',
    age: 42,
    dateOfBirth: '1983-06-10',
    gender: 'Female',
    maritalStatus: 'Married',
    email: 'nisha.patel@example.com',
    phoneNumber: '+1-555-234-5678',
    relationship: 'Mother',
    status: invitationStatus.pending,
    samajName: 'Shree Gujarati Samaj',
  ),
  FamilyMembersModel(
    firstName: 'Riya',
    lastName: 'Patel',
    age: 18,
    dateOfBirth: '2007-03-22',
    gender: 'Female',
    maritalStatus: 'Single',
    email: 'riya.patel@example.com',
    phoneNumber: '+1-555-345-6789',
    relationship: 'Daughter',
    status: invitationStatus.declined,
    samajName: 'Shree Gujarati Samaj',
  ),
  FamilyMembersModel(
    firstName: 'Jay',
    lastName: 'Patel',
    age: 15,
    dateOfBirth: '2010-07-18',
    gender: 'Male',
    maritalStatus: 'Single',
    email: 'jay.patel@example.com',
    phoneNumber: '+1-555-456-7890',
    relationship: 'Son',
    status: invitationStatus.accepted,
    samajName: 'Shree Gujarati Samaj',
  ),
  FamilyMembersModel(
    firstName: 'Meena',
    lastName: 'Shah',
    age: 68,
    dateOfBirth: '1957-11-05',
    gender: 'Female',
    maritalStatus: 'Widowed',
    email: 'meena.shah@example.com',
    phoneNumber: '+1-555-567-8901',
    relationship: 'Grandmother',
    status: invitationStatus.pending,
    samajName: 'Shree Gujarati Samaj',
  ),
];
