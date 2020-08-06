import 'package:flutter/material.dart';
import 'package:khoneyab/widgets/requestOptionItem.dart';

class AddRequestDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            "ثبت درخواست جدید",
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
                    "مشخصات آپارتمان مورد نظر را وارد کنید",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Expanded(flex: 13, child: RequestOptions())
              ],
            ),
          ),
        ));
  }
}

class RequestOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        RequestOptionItem(
          optionTitle: 'منطقه مورد نظر ملک', 
        ),
      ],
    );
  }
}
