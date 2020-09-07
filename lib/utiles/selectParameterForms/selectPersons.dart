import 'package:flutter/material.dart';
import 'package:khoneyab/provider/mainProvider.dart';
import 'package:provider/provider.dart';

class SelectPersons extends StatefulWidget {
  @override
  _SelectPersonsState createState() => _SelectPersonsState();
}

class _SelectPersonsState extends State<SelectPersons> {
  _makeButtonOption(btnData) {
    return FlatButton(
        child: Text(
          btnData.personsTitle,
          style: Theme.of(context).textTheme.headline3,
        ),
        onPressed: () {
          // ذخیره داده دکمه انتخاب شده در متغیر اطلاعات جاری درخواست
          Provider.of<MainProvider>(context, listen: false).setPersons(btnData);
          Navigator.of(context).pop();
        });
  }

  @override
  Widget build(BuildContext context) {
// دریافت اطلاعات آپشن ها و ذخیره به صورت لیستی از دکمه ها
    List<Widget> personItems = List<Widget>.from(context
        .watch<MainProvider>()
        .apartemandata
        .persons
        .map((btnData) => _makeButtonOption(btnData)));

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Text('تعداد نفرات خانوار را مشخص کنید'),
              content: SingleChildScrollView(
                child: ListBody(children: personItems),
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
              "تعداد نفرات خانوار",
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
                        "تعداد نفرات",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          _showMyDialog();
                        },
                        child: Container(
                          child: Text(
                              context
                                  .watch<MainProvider>()
                                  .currentApartemanData
                                  .persons
                                  .first
                                  .personsTitle,
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
          ],
        ),
      ),
    );
  }
}
