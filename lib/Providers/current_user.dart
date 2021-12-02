import 'package:flutter/material.dart';

class CurrentUser with ChangeNotifier {
  final User _currentUser = User(
    id: '1',
    fName: 'Hamno',
    lName: 'Jabbar',
    city: 'Sulaymaniyah',
    profileImage: 'assets/images/avatar.png',
    houseNo: '12',
    street: 'Rizgary',
    phone: '07718844051',
    email: 'hamnojabar@gmail.com',
    password: 'hamno1999',
  );
  User get currentUser {
    return _currentUser;
  }
}

class User {
  final String id;
  final String fName;
  final String lName;
  final String profileImage;
  final String phone;
  final String city;
  final String street;
  final String houseNo;
  final String email;
  final String password;
  User(
      {required this.id,
      required this.fName,
      required this.lName,
      required this.profileImage,
      required this.phone,
      required this.city,
      required this.street,
      required this.houseNo,
      required this.email,
      required this.password});
}
