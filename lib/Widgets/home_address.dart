import 'package:flutter/material.dart';

import '../Widgets/delivery_schedule.dart';

class HomeAddress extends StatefulWidget {
  const HomeAddress({Key? key}) : super(key: key);

  @override
  _HomeAddressState createState() => _HomeAddressState();
}

class _HomeAddressState extends State<HomeAddress> {
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Text(
            'Delivers To:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
              ),
              child: Text(
                '- Home:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Slemani',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Rizgary',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '01',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '02',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '03',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Text(
                    'Note',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Material(
                  color: Colors.white,
                  elevation: 5,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    controller: _noteController,
                    maxLines: 7,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.0),
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
            ),
          ),
        ),
        const DeliverySchedule(),
      ],
    );
  }
}
