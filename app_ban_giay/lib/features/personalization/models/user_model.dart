import 'package:app_ban_giay/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{

  final String id;
  String fullName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  //Constructor
  UserModel({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //Helper func phoneNum
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  //Static
  static UserModel empty() => UserModel(id: '', fullName: '', username: '', email: '', phoneNumber: '', profilePicture: '');

  //
  Map<String, dynamic> toJson(){
    return{
      'FullName': fullName,
      'UserName': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }


  //
  factory UserModel.fromSnapshot (DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;
      return UserModel(
        id: document.id, 
        fullName: data['FullName'] ?? '', 
        username: data['UserName'] ?? '', 
        email: data['Email'] ?? '', 
        phoneNumber: data['PhoneNumber'] ?? '', 
        profilePicture: data['ProfilePicture'] ?? ''
      );
    } 
    else {
      throw Exception("Không có giá trị");
    }
  }
}