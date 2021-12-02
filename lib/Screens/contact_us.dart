// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import '../Screens/home_page.dart';

import '../Widgets/main_button.dart';

class ContactUs extends StatelessWidget {
  static const routeName = '/contact-us';
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Contact Us',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 15,
            ),
            child: Text(
              'Your Message',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Material(
            color: Colors.white,
            elevation: 5,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: TextField(
              maxLines: 13,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white70),
            ),
          ),
          Container(
            height: 160,
            width: double.maxFinite,
            margin: const EdgeInsets.only(
              top: 50,
              bottom: 40,
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
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'eCommerce',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'support@ecommerce.com',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  '+9647701234567',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          const MainButton(buttonName: 'Send', path: HomePage.routeName),
        ],
      ),
    );
  }
}
