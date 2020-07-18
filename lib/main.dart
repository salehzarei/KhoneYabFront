import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khoneyab/checkLoginCode.dart';
import 'package:khoneyab/homePage.dart';
import 'package:khoneyab/login.dart';
import 'package:khoneyab/pages/requestDetails.dart';
import 'package:khoneyab/pages/userRequestList.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MaterialApp(
            theme: ThemeData(
                fontFamily: 'iransans',
                textTheme: TextTheme(
                    headline1:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    headline2: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Colors.black))),
            debugShowCheckedModeBanner: false,
            initialRoute: 'RequestDetails',
            routes: {
              '/': (context) => LoginPage(),
              'homepage': (context) => HomePage(),
              'checkLoginCode': (context) => CheckLoginCode(),
              'UserRequestList': (context) => UserRequestList(),
              'RequestDetails': (context) => RequestDetails()
            },
          )));
}
