import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:khoneyab/provider/mainProvider.dart';
import 'package:khoneyab/widgets/requestOptionItem.dart';

class AddRequestDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MainProvider>(context, listen: false).makeNewApartemanData();
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
                Expanded(flex: 8, child: RequestOptions()),
                Align(
                  alignment: Alignment.topLeft,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Theme.of(context).buttonColor,
                    child: Text(
                      "مرحله بعدی",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(flex: 2, child: Container())
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
          optionIndex: 0,
        ),
        RequestOptionItem(
          optionTitle: 'متراژ مورد نظر',
          optionIndex: 1,
        ),
        RequestOptionItem(
          optionTitle: 'ودیعه مورد نظر',
          optionIndex: 0,
        ),
        RequestOptionItem(
          optionTitle: 'اجاره مورد نظر',
          optionIndex: 0,
        ),
        RequestOptionItem(
          optionTitle: 'سن بنای مورد نظر',
          optionIndex: 0,
        ),
        RequestOptionItem(
          optionTitle: 'طبقه مورد نظر',
          optionIndex: 0,
        ),
        RequestOptionItem(
          optionTitle: 'تعداد خواب مورد نظر',
          optionIndex: 0,
        ),
        RequestOptionItem(
          optionTitle: 'آسانسور مورد نظر',
          optionIndex: 0,
        ),
        RequestOptionItem(
          optionTitle: 'انباری مورد نظر',
          optionIndex: 0,
        ),
        RequestOptionItem(
          optionTitle: 'تعداد نفرات',
          optionIndex: 0,
        ),
      ],
    );
  }
}
