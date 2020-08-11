import 'package:flutter/material.dart';
import 'package:khoneyab/models/defaultApartemanOptionsModel.dart';
import 'package:khoneyab/provider/mainProvider.dart';
import 'package:provider/provider.dart';

Widget location(BuildContext context) {
  List<Location> _locationData =
      Provider.of<MainProvider>(context , listen: false).apartemandata.location;
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scrollbar(
        child: ListView.builder(
          itemCount: _locationData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  trailing: Checkbox(value: true, onChanged: (value) {}),
                  title: Text(_locationData[index].locationName),
                ),
                Container(
                  color: Colors.grey.shade300,
                  height: 1,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
