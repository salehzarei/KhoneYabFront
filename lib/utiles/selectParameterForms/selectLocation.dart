import 'package:khoneyab/models/defaultApartemanOptionsModel.dart';
import 'package:khoneyab/provider/mainProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

List<Location> _items;
List<bool> _stateList;

class _SelectLocationState extends State<SelectLocation> {
// متغییر نوع دکمه حداقل یا حداکثر
//  int bTnindex = 0;

  // _makeButtonOption(btnData) {
  //   return CheckboxListTile(
  //     key: UniqueKey(),
  //     secondary: Text(
  //       btnData.locationName,
  //       style: Theme.of(context).textTheme.headline3,
  //     ),
  //     value: _selected,
  //     onChanged: (value) {
  //       if (value) {
  //         context
  //             .read<MainProvider>()
  //             .currentApartemanData
  //             .location
  //             .add(btnData);
  //       }
  //       setState(() {
  //         _selected = value;
  //       });
  //     },
  //   );
  // }
  _itemSelectBtn(int index, Location location) {
    return CheckboxListTile(
      key: UniqueKey(),
      secondary: Text(
        location.locationName,
        style: Theme.of(context).textTheme.headline3,
      ),
      value: _stateList[index],
      onChanged: (value) {
        // اضافه کردن آیتم تیک خورده به لیست
        if (value) {
          context
              .read<MainProvider>()
              .currentApartemanData
              .location
              .add(location);
        } else {
          //حذف آیتم انتخاب نشده از لیست
          context
              .read<MainProvider>()
              .currentApartemanData
              .location
              .removeWhere(
                  (element) => element.locationName == location.locationName);
        }
        setState(() {
          _stateList[index] = value;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _stateList = Provider.of<MainProvider>(context, listen: false)
        .apartemandata
        .location
        .map((e) => e.locationName.isEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // print(_stateList);
    print(Provider.value(
      value: _stateList,
      updateShouldNotify: (oldValue, newValue) => true,
    ));

    _items = Provider.of<MainProvider>(context, listen: false)
        .apartemandata
        .location;

    // _items = List<Widget>.from(Provider.of<MainProvider>(context, listen: false)
    //     .apartemandata
    //     .location
    //     .map((btnData) => _makeButtonOption(btnData)));

    // // دریافت اطلاعات آپشن ها و ذخیره به صورت لیستی از دکمه ها
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
                    //                 return _items[index];
                    return _itemSelectBtn(index, _items[index]);
                  }))),
    );
  }
}
