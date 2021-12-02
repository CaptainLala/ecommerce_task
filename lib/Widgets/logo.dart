import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          Container(
            child: Image.asset('assets/images/login_logo.png'),
            height: (h + w) * 0.15,
            margin: EdgeInsets.only(
              top: h * 0.035,
            ),
          ),
          Text(
            'eCommerce',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: (h * w) / (7 * 1000),
            ),
          ),
        ],
      ),
    );
  }
}
