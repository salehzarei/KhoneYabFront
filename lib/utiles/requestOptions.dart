import 'package:flutter/material.dart';
import 'selectParameterForms/selectLocation.dart';
import 'selectParameterForms/selectMetric.dart';

class RequestOptionList extends StatelessWidget {
  final int optionindex;

  RequestOptionList({this.optionindex});
  @override
  Widget build(BuildContext context) {
    List<Widget> requestOptionList = [
      location(context),
      metric(context),
    ];
    return requestOptionList[optionindex];
  }
}
