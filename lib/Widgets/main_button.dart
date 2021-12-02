import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String buttonName;
  final String path;
  const MainButton({
    Key? key,
    required this.buttonName,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              buttonName,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, path);
          },
        ),
      ),
    );
  }
}
