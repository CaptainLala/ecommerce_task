import 'package:flutter/material.dart';

import '../Widgets/delivery_schedule.dart';
import '../Widgets/input_field.dart';

class DifferentAddress extends StatefulWidget {
  const DifferentAddress({Key? key}) : super(key: key);

  @override
  _DifferentAddressState createState() => _DifferentAddressState();
}

class _DifferentAddressState extends State<DifferentAddress> {
  final _cityController = TextEditingController();
  final _streetController = TextEditingController();
  final _houseNoController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    _streetController.dispose();
    _houseNoController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  label: 'City',
                  controller: _cityController,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  password: false,
                ),
                InputField(
                  label: 'Street',
                  controller: _streetController,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  password: false,
                ),
                InputField(
                  label: 'House Number',
                  controller: _houseNoController,
                  type: TextInputType.number,
                  action: TextInputAction.next,
                  password: false,
                ),
                InputField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  type: TextInputType.phone,
                  action: TextInputAction.done,
                  password: false,
                ),
              ],
            ),
          ),
        ),
        const DeliverySchedule(),
      ],
    );
  }
}
