import 'package:flutter/material.dart';

class RequestSetting extends StatefulWidget {
  @override
  _RequestSettingState createState() => _RequestSettingState();
}

class _RequestSettingState extends State<RequestSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.green.shade300, width: 2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /// ردیف اول
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Checkbox(value: true, onChanged: (v) {}),
                      Text(
                        "اجازه تماس با من فعال",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Checkbox(value: true, onChanged: (v) {}),
                      Text("اطلاع رسانی در مشاور جدید",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
          ),

          /// ردیف دوم
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Checkbox(value: true, onChanged: (v) {}),
                        Text(
                          "چت فعال",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Checkbox(value: true, onChanged: (v) {}),
                        Text("نمایش شماره من",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
      
    );
  }
}
