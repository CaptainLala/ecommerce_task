import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType type;
  final TextInputAction action;
  final bool password;
  const InputField({
    Key? key,
    required this.label,
    required this.controller,
    required this.type,
    required this.action,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            top: 15,
          ),
          child: Text(
            '$label:',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Material(
          color: Colors.white,
          elevation: 3,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: type,
            textInputAction: action,
            decoration: const InputDecoration(
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
      ],
    );
  }
}
