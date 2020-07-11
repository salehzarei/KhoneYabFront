import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _pagewidth = MediaQuery.of(context).size.width;
    double _pageheight = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: _pagewidth,
            height: _pageheight,
            color: Colors.white60,
            child: Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "ورود به اپلیکیشن",
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.right,
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: _pageheight * 0.25),
                    child: Container(
                      alignment: Alignment.center,
                      width: _pagewidth * 0.75,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 25),
                        maxLength: 11,
                        onSubmitted: (_)=>Navigator.pushNamed(context, 'checkLoginCode'),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            counterText: "",
                            hintText: "شماره تلفن همراه را وارد کنید",
                            hintStyle: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        height: 50,
                        child: RaisedButton(
                          onPressed: ()=>Navigator.pushNamed(context, 'checkLoginCode'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.blueAccent.shade700,
                                      Colors.greenAccent.shade700
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                              constraints:
                                  BoxConstraints(maxWidth: 300, minHeight: 50),
                              alignment: Alignment.center,
                              child: Text(
                                "ورود به سیستم",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 35),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "حساب کاربری ندارید؟ ",
                          ),
                          Text(
                            "اینجا ضربه بزنید",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
