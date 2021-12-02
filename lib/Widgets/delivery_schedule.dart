import 'package:flutter/material.dart';

class DeliverySchedule extends StatefulWidget {
  const DeliverySchedule({Key? key}) : super(key: key);

  @override
  _DeliveryScheduleState createState() => _DeliveryScheduleState();
}

class _DeliveryScheduleState extends State<DeliverySchedule> {
  final _dateController = TextEditingController();
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _fromController.dispose();
    _toController.dispose();
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
            'Delivery Schedule:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                    'Date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  height: 45,
                  child: Material(
                    color: Colors.white,
                    elevation: 5,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _dateController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
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
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text(
                      'From',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 45,
                    child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _fromController,
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text(
                      'To',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 45,
                    child: Material(
                      color: Colors.white,
                      elevation: 5,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _toController,
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
