import 'package:app_ban_giay/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  //Constructor
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //Hepler func get the full name
  String get fullName => '$firstName $lastName';

  //Helper func phoneNum
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  //Static func to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  //Static func generate uiser name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  //Static
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'FirstName': firstName,
  //     'LastName': lastName,
  //     'UserName': username,
  //     'Email': email,
  //     'PhoneNumber': phoneNumber,
  //     'ProfilePicture': profilePicture,
  //   };
  // }
  Map<String, dynamic> toJson() {
    return {
      'Họ': firstName,
      'Tên': lastName,
      'Tên tài khoản': username,
      'E-mail': email,
      'Số điện thoại': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  //
  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //         id: document.id,
  //         firstName: data['FirstName'] ?? '',
  //         lastName: data['LastName'] ?? '',
  //         username: data['UserName'] ?? '',
  //         email: data['Email'] ?? '',
  //         phoneNumber: data['PhoneNumber'] ?? '',
  //         profilePicture: data['ProfilePicture'] ?? '');
  //   } else {
  //     return UserModel.empty();
  //   }
  // }
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['Họ'] ?? '',
          lastName: data['Tên'] ?? '',
          username: data['Tên tài khoản'] ?? '',
          email: data['E-mail'] ?? '',
          phoneNumber: data['Số điện thoại'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
}
