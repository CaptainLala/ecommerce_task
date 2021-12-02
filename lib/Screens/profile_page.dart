import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/home_page.dart';

import '../Providers/current_user.dart';

import '../Widgets/input_field.dart';
import '../Widgets/main_button.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _fNameController;
  late TextEditingController _lNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _cityController;
  late TextEditingController _streetController;
  late TextEditingController _houseNoController;

  @override
  void initState() {
    final user = Provider.of<CurrentUser>(context, listen: false).currentUser;
    super.initState();
    _fNameController = TextEditingController(text: user.fName);
    _lNameController = TextEditingController(text: user.lName);
    _phoneController = TextEditingController(text: user.phone);
    _emailController = TextEditingController(text: user.email);
    _cityController = TextEditingController(text: user.city);
    _streetController = TextEditingController(text: user.street);
    _houseNoController = TextEditingController(text: user.houseNo);
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _houseNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 25,
        ),
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Update Your Profile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          InputField(
            label: 'First Name',
            controller: _fNameController,
            action: TextInputAction.next,
            type: TextInputType.text,
            password: false,
          ),
          InputField(
            label: 'Last Name',
            controller: _lNameController,
            action: TextInputAction.next,
            type: TextInputType.text,
            password: false,
          ),
          InputField(
            label: 'Phone Number',
            controller: _phoneController,
            action: TextInputAction.next,
            type: TextInputType.phone,
            password: false,
          ),
          InputField(
            label: 'Email Address',
            controller: _emailController,
            action: TextInputAction.next,
            type: TextInputType.emailAddress,
            password: false,
          ),
          InputField(
            label: 'City',
            controller: _cityController,
            action: TextInputAction.next,
            type: TextInputType.text,
            password: false,
          ),
          InputField(
            label: 'Street',
            controller: _streetController,
            action: TextInputAction.next,
            type: TextInputType.text,
            password: false,
          ),
          InputField(
            label: 'House Number',
            controller: _houseNoController,
            action: TextInputAction.done,
            type: TextInputType.number,
            password: false,
          ),
          const SizedBox(
            height: 20,
          ),
          const MainButton(buttonName: 'Save', path: HomePage.routeName),
        ],
      ),
    );
  }
}
