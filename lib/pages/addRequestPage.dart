import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khoneyab/widgets/requestMenuItem.dart';

class AddRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.close , color: Colors.grey,),
              onPressed: () => Navigator.pushNamed(context, 'homepage')),
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
                    "دسته بندی درخواست را انتخاب کنید",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Expanded(flex: 13, child: RequestStep1())
              ],
            ),
          ),
        ));
  }
}

class RequestStep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        RequestMenuItem(
          menuIcon: FontAwesomeIcons.city,
          menuTitle: 'رهن و اجاره آپارتمان',
        ),
        RequestMenuItem(
          menuIcon: FontAwesomeIcons.home,
          menuTitle: 'رهن و اجاره ویلایی',
        ),
        RequestMenuItem(
          menuIcon: FontAwesomeIcons.storeAlt,
          menuTitle: 'رهن و اجاره آپارتمان',
        ),
        RequestMenuItem(
          menuIcon: FontAwesomeIcons.building,
          menuTitle: 'رهن و اجاره آپارتمان',
        )
      ],
    );
  }
}
