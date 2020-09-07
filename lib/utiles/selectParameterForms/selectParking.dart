import 'package:flutter/material.dart';
import 'package:khoneyab/provider/mainProvider.dart';
import 'package:provider/provider.dart';

class SelectParking extends StatefulWidget {
  @override
  _SelectParkingState createState() => _SelectParkingState();
}

class _SelectParkingState extends State<SelectParking> {
  @override
  Widget build(BuildContext context) {
    bool _bTnState = context.watch<MainProvider>().currentApartemanData.parking;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              "وضعیت پارکینگ",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        "پارکینگ داشته باشد",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      flex: 3,
                      child: Checkbox(
                          value: _bTnState,
                          onChanged: (value) {
                            context.read<MainProvider>().setParking = value;
                            Navigator.of(context).pop();
                          }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
