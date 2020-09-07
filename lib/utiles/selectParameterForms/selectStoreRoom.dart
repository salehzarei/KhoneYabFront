import 'package:flutter/material.dart';
import 'package:khoneyab/provider/mainProvider.dart';
import 'package:provider/provider.dart';

class SelectStoreRoom extends StatefulWidget {
  @override
  _SelectStoreRoomState createState() => _SelectStoreRoomState();
}

class _SelectStoreRoomState extends State<SelectStoreRoom> {
  @override
  Widget build(BuildContext context) {
    bool _bTnState =
        context.watch<MainProvider>().currentApartemanData.storeroom;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              "وضعیت انباری",
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
                        "انباری داشته باشد",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      flex: 3,
                      child: Checkbox(
                          value: _bTnState,
                          onChanged: (value) {
                            context.read<MainProvider>().setStoreRoom = value;
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