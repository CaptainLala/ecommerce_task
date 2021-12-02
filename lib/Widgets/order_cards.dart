import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Providers/orders.dart';

import '../Screens/invoice_page.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard(this.order, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    if (order.status == 'Unpaid') {
      color = Colors.red;
    } else if (order.status == 'Paid') {
      color = Colors.lightGreen;
    } else if (order.status == 'Processing') {
      color = Colors.lightBlue;
    } else if (order.status == 'Delivered') {
      color = Colors.green;
    }
    return Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
        top: 20,
      ),
      width: double.infinity,
      height: 270,
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
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order ID: ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  order.id,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              DateFormat('dd MM yyyy hh:mm').format(order.dateTime),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Order Status: ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                order.status,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              'Received',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 180,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'View Invoice',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    InvoicePage.routeName,
                    arguments: order.id,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Navigator.pushNamed(context, '/', arguments: id,); <= to pass id with the navigator object
// ModalRoute.of(context).settings.arguments as String; <= to get the id from the invoice page [write this inside build widget]
