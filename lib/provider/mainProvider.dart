import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:khoneyab/models/apartemanRequestModel.dart';
import 'package:khoneyab/models/defaultApartemanOptionsModel.dart';

class MainProvider with ChangeNotifier {
  ApartemanRentOptionModel apartemandata;

  /// ذخیره موقت درخواست آپارتمان قبل از ارسال به سرور
  ApartemanRentModel _currentApartemanRequest;

  ApartemanRentModel get currentApartemanData {
    return _currentApartemanRequest;
  }


  makeNewApartemanData() {
    _currentApartemanRequest = ApartemanRentModel(
        userId: '0000',
        requestId: '01',
        buildAge: ['0', '0'],
        buildFloor: ['0', '0'],
        buildroom: ['0', '0'],
        eleveator: true,
        location: ['1', '2', '3'],
        metric: ['30', '100'],
        mortgagePrice: ['0', '1'],
        parking: true,
        storeroom: true,
        rentPrice: ['0', '1'],
        persons: '2');
  }

  changeCurretAparemanData(List<Metric> data) {
    print(data[0].metricName);
    _currentApartemanRequest.metric[0] = data[0].metricValue.toString();
    print(_currentApartemanRequest.metric[0]);
    notifyListeners();
    return null;
  }

// خواندن فایل json آپشن های درخواست آپارتمان
  Future<ApartemanRentOptionModel> loadApartemanOption() async {
    String jsonString = await rootBundle
        .loadString('assets/jsons/defaultApartemanOptions.json');
    final jsonResult = json.decode(jsonString);
    apartemandata = ApartemanRentOptionModel.fromJson(jsonResult);
    notifyListeners();
    return null;
  }
}
