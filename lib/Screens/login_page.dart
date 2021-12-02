import 'package:flutter/material.dart';

import './home_page.dart';
import './register_page.dart';

import '../Widgets/input_field.dart';
import '../Widgets/logo.dart';
import '../Widgets/main_button.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool checkBoxValue = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: h * 0.01,
          horizontal: w * 0.05,
        ),
        children: [
          const Logo(),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                  action: TextInputAction.done,
                  password: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: h * 0.02,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  checkBoxValue = !checkBoxValue;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    side: const BorderSide(
                      color: Colors.black26,
                      width: 1,
                    ),
                    value: checkBoxValue,
                    onChanged: (_) {
                      setState(() {
                        checkBoxValue = !checkBoxValue;
                      });
                    },
                  ),
                  Text(
                    'Remember Me',
                    style: TextStyle(
                      fontSize: (h * w) / (16 * 1000),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          const MainButton(
            buttonName: 'Login',
            path: HomePage.routeName,
          ),
          SizedBox(
            height: h * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                ),
                child: Text(
                  'Register Now',
                  style: TextStyle(
                    fontSize: (h * w) / (14 * 1000),
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterPage.routeName);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
