import 'package:flutter/material.dart';
import 'package:khoneyab/provider/mainProvider.dart';
import 'package:provider/provider.dart';

class SelectBuildFloor extends StatefulWidget {
  @override
  _SelectBuildFloorState createState() => _SelectBuildFloorState();
}

class _SelectBuildFloorState extends State<SelectBuildFloor> {
 
 
// متغییر نوع دکمه حداقل یا حداکثر
  int bTnindex = 0;

  _makeButtonOption(btnData) {
    return FlatButton(
        child: Text(
          btnData.buildFloorTitle,
          style: Theme.of(context).textTheme.headline3,
        ),
        onPressed: () {
          // ذخیره داده دکمه انتخاب شده در متغیر اطلاعات جاری درخواست
          context.read<MainProvider>().currentApartemanData.buildFloor[bTnindex] =
              btnData;
          setState(() {});
          Navigator.of(context).pop();
        });
  }

  @override
  Widget build(BuildContext context) {
    // دریافت اطلاعات آپشن ها و ذخیره به صورت لیستی از دکمه ها
    List<Widget> _items = List<Widget>.from(context
        .watch<MainProvider>()
        .apartemandata
        .buildFloor
        .map((btnData) => _makeButtonOption(btnData)));

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Text('طبقه مورد نظر'),
              content: SingleChildScrollView(
                child: ListBody(children: _items),
              ),
            ),
          );
        },
      );
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(
              "حداقل و حداکثر طبقه را مشخص کنید",
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
                        "حداقل طبقه ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          _showMyDialog();
                          setState(() {
                            bTnindex = 0;
                          });
                        },
                        child: Container(
                          child: Text(
                              context
                                  .watch<MainProvider>()
                                  .currentApartemanData
                                  .buildFloor
                                  .first
                                  .buildFloorTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ))
                ],
              ),
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
                        "حداکثر طبقه ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          _showMyDialog();
                          setState(() {
                            bTnindex = 1;
                          });
                        },
                        child: Container(
                          child: Text(
                              context
                                  .watch<MainProvider>()
                                  .currentApartemanData
                                  .buildFloor
                                  .last
                                  .buildFloorTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}