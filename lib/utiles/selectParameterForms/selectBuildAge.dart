import 'package:khoneyab/provider/mainProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SelectBuildAge extends StatefulWidget {
  @override
  _SelectBuildAgeState createState() => _SelectBuildAgeState();
}

class _SelectBuildAgeState extends State<SelectBuildAge> {
 
// متغییر نوع دکمه حداقل یا حداکثر
  int bTnindex = 0;

  _makeButtonOption(btnData) {
    return FlatButton(
        child: Text(
          btnData.buildAgeTitle,
          style: Theme.of(context).textTheme.headline3,
        ),
        onPressed: () {
          // ذخیره داده دکمه انتخاب شده در متغیر اطلاعات جاری درخواست
          context.read<MainProvider>().setAge(bTnindex, btnData);
          Navigator.of(context).pop();
        });
  }

  @override
  Widget build(BuildContext context) {
    // دریافت اطلاعات آپشن ها و ذخیره به صورت لیستی از دکمه ها
    List<Widget> metricItems = List<Widget>.from(context
        .watch<MainProvider>()
        .apartemandata
        .buildAge
        .map((btnData) => _makeButtonOption(btnData)));

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Text('سن بنای مورد نظر'),
              content: SingleChildScrollView(
                child: ListBody(children: metricItems),
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
              "حداقل و حداکثر سن بنا را مشخص کنید",
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
                        "حداقل سن",
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
                                  .buildAge
                                  .first
                                  .buildAgeTitle,
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
                        "حداکثر سن ",
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
                                  .buildAge
                                  .last
                                  .buildAgeTitle,
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