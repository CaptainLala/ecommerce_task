import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/orders.dart';

import '../Widgets/side_menu.dart';
import '../Widgets/order_cards.dart';
import '../Widgets/empty_orders.dart';

class MyOrdersPage extends StatelessWidget {
  static const routeName = '/my-orders';

  const MyOrdersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).orders;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Orders',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: orders.isNotEmpty
          ? ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderCard(orders[index]);
              },
            )
          : const EmptyOrders(),
    );
  }
}
