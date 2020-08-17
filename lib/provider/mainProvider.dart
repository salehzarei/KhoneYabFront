import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:khoneyab/models/apartemanRequestModel.dart';
import 'package:khoneyab/models/defaultApartemanOptionsModel.dart';

class MainProvider with ChangeNotifier {
  ApartemanRentOptionModel _apartemandata = ApartemanRentOptionModel();

  ApartemanRentOptionModel get apartemandata {
    return _apartemandata;
  }

  /// ذخیره موقت درخواست آپارتمان قبل از ارسال به سرور
  ApartemanRentModel _currentApartemanRequest = ApartemanRentModel();

  ApartemanRentModel get currentApartemanData {
    return _currentApartemanRequest;
  }

  optionShowDes(int index) {
    var _keyOfCurrent =
        _currentApartemanRequest.toJson().entries.elementAt(index);

    switch (_keyOfCurrent.key) {
      case 'buildAge':
        {
          return Text(
              'سن بنای مورد نظر بین ${_apartemandata.toJson().entries.toList().elementAt(index).value[0]}');
        }
        break;

      case 'buildFloor':
        {
          return Text(
              'طبقه مورد نظر ${_apartemandata.buildFloor[0].buildFloorTitle}');
        }
        break;
      case 'buildroom':
        {
          return Text('تعداد خواب موردنظر');
        }
        break;
      case 'eleveator':
        {
          return Text('آسانسور');
        }
        break;
      case 'location':
        {
          return Text('منطقه مورد نظر');
        }
        break;
      case 'metric':
        {
          return Text(
              'متراژ مورد نظر ${_apartemandata.metric[int.parse(_keyOfCurrent.value[0])].metricName} الی ${_apartemandata.metric[int.parse(_keyOfCurrent.value[1])].metricName}');
        }
        break;
      case 'mortgagePrice':
        {
          return Text('ودیعه مورد نظر');
        }
        break;
      case 'parking':
        {
          return Text('پارکینگ');
        }
        break;
      case 'storeroom':
        {
          return Text('انباری');
        }
        break;
      case 'rentPrice':
        {
          return Text('اجاره مورد نظر');
        }
        break;
      case 'persons':
        {
          return Text('تعداد نفرات');
        }
        break;

      default:
        {
          return Text('نامشخص');
        }
        break;
    }

    // apartemandata.toJson().forEach((key, value) {
    //   if (key == _keyOfCurrent) {
    //     print(apartemandata.toJson().entries.toList().elementAt(index).value);
    //   }
    // });

    // Map<String, Widget> titleOfOptions = {
    //   'buildAge': Text('سن بنای مورد نظر'),
    //   'buildFloor': Text('طبقه مورد نظر'),
    //   'buildroom': Text('تعداد خواب موردنظر'),
    //   'eleveator': Text('آسانسور'),
    //   'location': Text('منطقه مورد نظر'),
    //   'metric': Text('متراژ مورد نظر'),
    //   'mortgagePrice': Text('ودیعه مورد نظر'),
    //   'parking': Text('پارکینگ'),
    //   'storeroom': Text('انباری'),
    //   'rentPrice': Text('اجاره مورد نظر'),
    //   'persons': Text('تعداد نفرات')
    // };
  }

  makeNewApartemanData() {
    _currentApartemanRequest = ApartemanRentModel(
      location: [Location(locationId: '111' , locationName: 'صالح آباید')]
    );
        
    print(apartemandata.location.first.locationName);
    print(_currentApartemanRequest.location.first.locationName);

    // userId: '0000',
    // requestId: '01',
    // buildAge: ['0', '0'],
    // buildFloor: ['0', '0'],
    // buildroom: ['0', '0'],
    // eleveator: true,
    // location: ['1', '2', '3'],
    // metric: ['0', '5'],
    // mortgagePrice: ['0', '1'],
    // parking: true,
    // storeroom: true,
    // rentPrice: ['0', '1'],
    // persons: '2');
  }

  // void changeMetricRequest(Metric data, int index) {
  //   _currentApartemanRequest.toJson().update(
  //       "metric",
  //       (newValue) =>
  //           _currentApartemanRequest.metric[index] = data.metricId.toString());
  //   print(_currentApartemanRequest.metric);
  //   notifyListeners();
  // }

  /// تغیر مقدار حداقل و حداکثر رهن
  // List<String> changeMortgageRequest(MortgagePrice data, int index) {
  //   _currentApartemanRequest.toJson().update(
  //       "mortgagePrice",
  //    //   (newValue) => _currentApartemanRequest.mortgagePrice[index] = data.mortgagePriceValue.toString();
  //          // data.mortgagePriceValue.toString());
  //   print(_currentApartemanRequest.mortgagePrice);
  //   notifyListeners();
  //   return _currentApartemanRequest.mortgagePrice;
  // }

// خواندن فایل json آپشن های درخواست آپارتمان
  Future<ApartemanRentOptionModel> loadApartemanOption() async {
    String jsonString = await rootBundle
        .loadString('assets/jsons/defaultApartemanOptions.json');
    final jsonResult = json.decode(jsonString);
    _apartemandata = ApartemanRentOptionModel.fromJson(jsonResult);
    notifyListeners();
    return null;
  }
}
