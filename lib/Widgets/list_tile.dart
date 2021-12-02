import 'package:flutter/material.dart';

class SideMenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback pressed;

  const SideMenuTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      onTap: pressed,
    );
  }
}
