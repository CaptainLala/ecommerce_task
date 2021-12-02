import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screens/login_page.dart';
import './Screens/register_page.dart';
import './Screens/home_page.dart';
import './Screens/cart_page.dart';
import './Screens/address_page.dart';
import './Screens/order_confirmation_page.dart';
import './Screens/my_orders_page.dart';
import './Screens/products_page.dart';
import './Screens/contact_us.dart';
import './Screens/feedback_page.dart';
import './Screens/profile_page.dart';
import './Screens/invoice_page.dart';
import './Screens/store_page.dart';

import './Providers/categories.dart';
import './Providers/products.dart';
import './Providers/orders.dart';
import './Providers/cart_items.dart';
import './Providers/current_user.dart';
import './Providers/stores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartItems(),
        ),
        ChangeNotifierProvider(
          create: (context) => CurrentUser(),
        ),
        ChangeNotifierProvider(
          create: (context) => Stores(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'eCommerce',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(37, 41, 88, 1),
          ),
          primaryColor: const Color.fromRGBO(37, 41, 88, 1),
          accentColor: const Color.fromARGB(255, 92, 90, 91),
        ),
        home: const LoginPage(),
        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
          RegisterPage.routeName: (context) => const RegisterPage(),
          HomePage.routeName: (context) => const HomePage(),
          CartPage.routeName: (context) => const CartPage(),
          AddressPage.routeName: (context) => const AddressPage(),
          OrderConfirmation.routeName: (context) => const OrderConfirmation(),
          MyOrdersPage.routeName: (context) => const MyOrdersPage(),
          ProductsPage.routeName: (context) => const ProductsPage(),
          ContactUs.routeName: (context) => const ContactUs(),
          FeedbackPage.routeName: (context) => const FeedbackPage(),
          ProfilePage.routeName: (context) => const ProfilePage(),
          InvoicePage.routeName: (context) => const InvoicePage(),
          StorePage.routeName: (context) => const StorePage(),
        },
      ),
    );
  }
}
