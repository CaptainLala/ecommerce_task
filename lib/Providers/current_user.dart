import 'package:ecommerce_task/Providers/user.dart';
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
