import 'package:ecommerce_task/Widgets/store_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './cart_page.dart';

import '../Providers/stores.dart';
import '../Providers/cart_items.dart';

import '../Widgets/side_menu.dart';
import '../Widgets/home_titles.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    final stores = Provider.of<Stores>(
      context,
      listen: false,
    ).items;
    return Scaffold(
      drawer: const Drawer(
        child: SideMenu(),
      ),
      appBar: AppBar(
        title: const Text('eCommerce'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: cart.cartItems.isEmpty
                ? IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CartPage.routeName);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                  )
                : Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CartPage.routeName);
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                        ),
                      ),
                      Positioned(
                        left: 32,
                        top: 4,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Text(
              'Welcome to eCommerce, find the best with us!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const HomePageTitle('Stores'),
          const Divider(
            thickness: 1,
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2),
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: stores.length,
            itemBuilder: (context, index) {
              return StoreCard(
                store: stores[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
