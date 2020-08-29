import 'package:flutter/material.dart';
import 'package:khoneyab/utiles/selectParameterForms/selectBuildAge.dart';
import 'package:khoneyab/utiles/selectParameterForms/selectBuildRoom.dart';
import 'package:khoneyab/utiles/selectParameterForms/selectEleveator.dart';
import 'package:khoneyab/utiles/selectParameterForms/selectFloor.dart';
import 'package:khoneyab/utiles/selectParameterForms/selectMortgage.dart';
import 'package:khoneyab/utiles/selectParameterForms/selectRentPrice.dart';
import 'selectParameterForms/selectLocation.dart';
import 'selectParameterForms/selectMetric.dart';

class RequestOptionList extends StatelessWidget {
  final int optionindex;
  

  RequestOptionList({this.optionindex});
  @override
  Widget build(BuildContext context) {
    List<Widget> requestOptionList = [
      SelectLocation(),
      SelectMetricOption(),
      SelectMortgageOption(),
      SelectRentPrice(),
      SelectBuildAge(),
      SelectBuildFloor(),
      SelectBuildRoom(),
      SelectEleveator()
    ];
    return requestOptionList[optionindex];
  }
}
