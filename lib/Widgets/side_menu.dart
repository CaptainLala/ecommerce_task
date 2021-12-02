import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/home_page.dart';
import '../Screens/login_page.dart';
import '../Screens/my_orders_page.dart';
import '../Screens/contact_us.dart';
import '../Screens/feedback_page.dart';
import '../Screens/profile_page.dart';

import '../Widgets/list_tile.dart';

import '../Providers/current_user.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUser>(context).currentUser;
    return ListView(
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ProfilePage.routeName);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 120,
                left: 26,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${user.fName} ${user.lName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.email,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 45,
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(user.profileImage),
                  ),
                ),
              ),
            ],
          ),
        ),
        SideMenuTile(
          title: 'Home',
          icon: Icons.home,
          pressed: () {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          },
        ),
        Divider(
          color: Theme.of(context).accentColor,
        ),
        SideMenuTile(
          title: 'My Orders',
          icon: Icons.shopping_bag,
          pressed: () {
            Navigator.pushReplacementNamed(context, MyOrdersPage.routeName);
          },
        ),
        Divider(
          color: Theme.of(context).accentColor,
        ),
        SideMenuTile(
          title: 'Contact Us',
          icon: Icons.phone,
          pressed: () {
            Navigator.pushNamed(context, ContactUs.routeName);
          },
        ),
        Divider(
          color: Theme.of(context).accentColor,
        ),
        SideMenuTile(
          title: 'Feedback',
          icon: Icons.thumb_up,
          pressed: () {
            Navigator.pushNamed(context, FeedbackPage.routeName);
          },
        ),
        Divider(
          color: Theme.of(context).accentColor,
        ),
        SideMenuTile(
          title: 'Logout',
          icon: Icons.logout,
          pressed: () {
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          },
        ),
        Divider(
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
