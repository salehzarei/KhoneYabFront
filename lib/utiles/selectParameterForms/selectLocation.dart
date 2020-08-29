import 'package:khoneyab/provider/mainProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
// متغییر نوع دکمه حداقل یا حداکثر
  int bTnindex = 0;
  List<bool> _stateList;
  bool _selected = false;

  _makeButtonOption(btnData) {
    return CheckboxListTile(
      key: UniqueKey(),
      secondary: Text(
        btnData.locationName,
        style: Theme.of(context).textTheme.headline3,
      ),
      value: _selected,
      onChanged: (value) {
        if (value) {
          context
              .read<MainProvider>()
              .currentApartemanData
              .location
              .add(btnData);
        }
        setState(() {
          _selected = value;
        });
      },
    );
  }

  List<Widget> _items;

  @override
  Widget build(BuildContext context) {
    _items = List<Widget>.from(Provider.of<MainProvider>(context, listen: false)
        .apartemandata
        .location
        .map((btnData) => _makeButtonOption(btnData)));
    // دریافت اطلاعات آپشن ها و ذخیره به صورت لیستی از دکمه ها
    // List<Widget> _items = List<Widget>.from(context
    //     .watch<MainProvider>()
    //     .apartemandata
    //     .location
    //     .map((btnData) => _makeButtonOption(btnData)));

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Scrollbar(
              child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return _items[index];
                  }))),
    );
  }
}
