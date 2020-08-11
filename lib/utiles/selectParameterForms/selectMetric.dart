import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:khoneyab/models/defaultApartemanOptionsModel.dart';
import 'package:khoneyab/provider/mainProvider.dart';

Widget metric(BuildContext context) {
   List<Widget> metricItems =
      List<Widget>.from(context.watch<MainProvider>().apartemandata.metric.map(
            (e) => FlatButton(
                child: Text(
                  e.metricName,
                  style: Theme.of(context).textTheme.headline3,
                ),
                onPressed: () {
                  context
                      .read<MainProvider>()
                      .currentApartemanData
                      .metric[0] = e.metricValue.toString();
                  Navigator.of(context).pop();
                }),
          ));

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text('متراژ مورد نظر را انتخاب کنید'),
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
            "متراژ مورد نظر خود را مشخص کنید",
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
                      "حداقل متراژ ",
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
                                .metric[0],
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
                      "حداکثر متراژ ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () => _showMyDialog(),
                      child: Container(
                        child: Text(
                            context
                                .watch<MainProvider>()
                                .currentApartemanData
                                .metric[1],
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
