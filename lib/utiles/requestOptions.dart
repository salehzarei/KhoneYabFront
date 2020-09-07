import 'package:flutter/material.dart';
import 'package:khoneyab/utiles/selectParameterForms/selectParking.dart';
import 'selectParameterForms/selectBuildAge.dart';
import 'selectParameterForms/selectBuildRoom.dart';
import 'selectParameterForms/selectEleveator.dart';
import 'selectParameterForms/selectFloor.dart';
import 'selectParameterForms/selectMortgage.dart';
import 'selectParameterForms/selectRentPrice.dart';
import 'selectParameterForms/selectLocation.dart';
import 'selectParameterForms/selectMetric.dart';
import 'selectParameterForms/selectPersons.dart';
import 'selectParameterForms/selectStoreRoom.dart';

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
      SelectPersons(),
      SelectEleveator(),
      SelectStoreRoom(),
      SelectParking()
    ];
    return requestOptionList[optionindex];
  }
}
