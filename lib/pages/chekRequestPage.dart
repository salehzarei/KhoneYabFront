import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khoneyab/models/apartemanRequestModel.dart';
import 'package:khoneyab/provider/mainProvider.dart';
import 'package:provider/provider.dart';

class CheckRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApartemanRentModel _currentOptions =
        context.watch<MainProvider>().currentApartemanData;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.edit,
                color: Colors.grey,
              ),
              onPressed: () => Navigator.pop(context)),
          title: Text(
            "بررسی نهایی درخواست",
            style: Theme.of(context).textTheme.headline1,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    "مشخصات آپارتمان مورد نظر شما",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Expanded(
                    flex: 13,
                    child: ListView.builder(
                        itemCount: _currentOptions.toJson().length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(context
                                  .watch<MainProvider>()
                                  .optionShowDes(index)
                                  .toString()));
                        })),
                Expanded(
                  flex: 5,
                  child: Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: () => context
                          .read<MainProvider>()
                          .sendRequestFromFile()
                          .whenComplete(
                              () => Navigator.pushNamed(context, 'homepage')),
                      color: Theme.of(context).buttonColor,
                      child: Text(
                        "ارسال درخواست",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
