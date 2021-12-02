import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './home_page.dart';

import '../Providers/orders.dart';

import '../Widgets/main_button.dart';

class OrderConfirmation extends StatelessWidget {
  static const routeName = '/order-confirmation';
  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderId = Provider.of<Orders>(context).getID();
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, '/home');
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Order Confirmation',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 180,
                top: 60,
              ),
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.green,
                    size: 100,
                  ),
                  const Text(
                    'Thank You',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Your Order Has Been Placed',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Your Order ID Is $orderId',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Text(
                    'You Can Check The Status Of Your Order In "My Orders" Menu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const MainButton(
              buttonName: 'Home',
              path: HomePage.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
