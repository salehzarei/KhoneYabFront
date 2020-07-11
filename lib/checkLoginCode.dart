import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CheckLoginCode extends StatefulWidget {
  @override
  _CheckLoginCodeState createState() => _CheckLoginCodeState();
}

class _CheckLoginCodeState extends State<CheckLoginCode> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _focus0 = FocusNode();
  final _focus1 = FocusNode();
  final _focus2 = FocusNode();
  final _focus3 = FocusNode();
  TextEditingController _n01 = TextEditingController();
  TextEditingController _n02 = TextEditingController();
  TextEditingController _n03 = TextEditingController();
  TextEditingController _n04 = TextEditingController();
  final CountdownController controller = CountdownController();
  bool _isTimeFinish = false;

  @override
  Widget build(BuildContext context) {
    double _pagewidth = MediaQuery.of(context).size.width;
    double _pageheight = MediaQuery.of(context).size.height;

    final InputDecoration _inputDecoration = InputDecoration(
        counterText: "",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.all(2));

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: _pagewidth,
            height: _pageheight,
            child: Padding(
              padding: EdgeInsets.only(top: _pageheight * 0.25),
              child: Column(
                children: <Widget>[
                  Text(
                    "کد احراز هویت",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //// input 4
                        Container(
                          height: 55,
                          width: 60,
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: _n04,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            focusNode: _focus3,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                FocusScope.of(context).requestFocus(_focus2);
                              } else {
                                if (_formKey.currentState.validate()) {
                                  print(
                                      "Compelet ! Code is ${_n01.text + _n02.text + _n03.text + _n04.text}");
                                      Navigator.pushNamed(context, 'homepage');
                                }
                              }
                            },
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                            decoration: _inputDecoration,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        //// input 3
                        Container(
                          height: 55,
                          width: 60,
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: _n03,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            focusNode: _focus2,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                FocusScope.of(context).requestFocus(_focus1);
                              } else {
                                FocusScope.of(context).requestFocus(_focus3);
                              }
                            },
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                            decoration: _inputDecoration,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        //// input 2
                        Container(
                          height: 55,
                          width: 60,
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: _n02,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            focusNode: _focus1,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                FocusScope.of(context).requestFocus(_focus0);
                              } else {
                                FocusScope.of(context).requestFocus(_focus2);
                              }
                            },
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                            decoration: _inputDecoration,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        //// input 1
                        Container(
                          height: 55,
                          width: 60,
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: _n01,
                            focusNode: _focus0,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                print("Empty!");
                              } else {
                                FocusScope.of(context).requestFocus(_focus1);
                              }
                            },
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                            decoration: _inputDecoration,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 35, horizontal: 36),
                      child: Text(
                        "لطفا کد چهاررقمی پیامک شده به شماره 09154127181 را در کادر بالا وارد نمایید",
                        textAlign: TextAlign.center,
                      )),
                  RaisedButton(
                    onPressed: _isTimeFinish ? () {} : null,
                    color: Colors.green.shade300,
                    child: Countdown(
                      controller: controller,
                      seconds: 120,
                      build: (_, double time) => _isTimeFinish
                          ? Text(
                              "ارسال مجدد کد احراز هویت",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          : Text(
                              "زمان باقی مانده " + time.round().toString() + " ثانیه",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                      interval: Duration(seconds: 1),
                      onFinished: () {
                        print('Timer is done!');
                        setState(() {
                          _isTimeFinish = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
