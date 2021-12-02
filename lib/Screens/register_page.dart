import 'package:flutter/material.dart';

import './home_page.dart';

import '../Widgets/logo.dart';
import '../Widgets/input_field.dart';
import '../Widgets/main_button.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _houseNoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _houseNoController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        children: [
          const Logo(),
          InputField(
            label: 'First Name',
            controller: _fNameController,
            type: TextInputType.text,
            action: TextInputAction.next,
            password: false,
          ),
          InputField(
            label: 'Last Name',
            controller: _lNameController,
            type: TextInputType.text,
            action: TextInputAction.next,
            password: false,
          ),
          InputField(
            label: 'Phone Number',
            controller: _phoneController,
            type: TextInputType.phone,
            action: TextInputAction.next,
            password: false,
          ),
          InputField(
            label: 'City',
            controller: _cityController,
            type: TextInputType.text,
            action: TextInputAction.next,
            password: false,
          ),
          InputField(
            label: 'Street',
            controller: _streetController,
            type: TextInputType.text,
            action: TextInputAction.next,
            password: false,
          ),
          InputField(
            label: 'House Number',
            controller: _houseNoController,
            type: TextInputType.number,
            action: TextInputAction.next,
            password: false,
          ),
          InputField(
            label: 'Email Address',
            controller: _emailController,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            password: false,
          ),
          InputField(
            label: 'Password',
            controller: _passwordController,
            type: TextInputType.text,
            action: TextInputAction.next,
            password: true,
          ),
          InputField(
            label: 'Confirm Password',
            controller: _confirmPassController,
            type: TextInputType.text,
            action: TextInputAction.done,
            password: true,
          ),
          const SizedBox(
            height: 30,
          ),
          const MainButton(
            buttonName: 'Register',
            path: HomePage.routeName,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
