import 'package:flutter/material.dart';

import '../Screens/home_page.dart';
import '../Widgets/main_button.dart';

class FeedbackPage extends StatelessWidget {
  static const routeName = '/feedback';
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 15,
              ),
              child: Text(
                'Your Feedback',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Material(
              color: Colors.white,
              elevation: 5,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: TextField(
                maxLines: 13,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white70),
              ),
            ),
            SizedBox(
              height: 220,
            ),
            MainButton(buttonName: 'Send', path: HomePage.routeName),
          ],
        ),
      ),
    );
  }
}
