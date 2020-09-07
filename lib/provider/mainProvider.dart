import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:khoneyab/models/apartemanRequestModel.dart';
import 'package:khoneyab/models/defaultApartemanOptionsModel.dart';

class MainProvider with ChangeNotifier {
  ApartemanRentOptionModel _apartemandata = ApartemanRentOptionModel();
  List<bool> _statelist;

  /// ذخیره ایندکس و وضعیت اوکیشن ها
  set stateList(List<bool> state) {
    _statelist = state;
    notifyListeners();
  }

  /// ست کردن مقدارهای متراژ مورد نظر
  setMetricItem(int metricIndex, Metric btnData) {
    currentApartemanData.metric[metricIndex] = btnData;
    notifyListeners();
  }

  /// ست کردن مقدارهای ودیعه مورد نظر
  setMortgage(int mortgageIndex, MortgagePrice mortgageData) {
    currentApartemanData.mortgagePrice[mortgageIndex] = mortgageData;
    notifyListeners();
  }

  /// ست کردن مقدارهای اجاره مورد نظر
  setRent(int rentIndex, RentPrice rentData) {
    currentApartemanData.rentPrice[rentIndex] = rentData;
    notifyListeners();
  }

  /// ست کردن مقدارهای سن بنا مورد نظر
  setAge(int ageIndex, BuildAge ageData) {
    currentApartemanData.buildAge[ageIndex] = ageData;
    notifyListeners();
  }

  /// ست کردن مقدارهای طبقات مورد نظر
  setFloor(int floorIndex, BuildFloor floorData) {
    currentApartemanData.buildFloor[floorIndex] = floorData;
    notifyListeners();
  }

  /// ست کردن تعداد اتاق خواب مورد نظر
  setRoom(int roomIndex, Buildroom roomData) {
    currentApartemanData.buildroom[roomIndex] = roomData;
    notifyListeners();
  }

  /// ست کردن تعداد نفرات مورد نظر
  setPersons(Person personData) {
    currentApartemanData.persons.first = personData;
    notifyListeners();
  }

  /// ست کردن آسانسور مورد نظر
 set  setEleveator(bool elevator) {
    currentApartemanData.eleveator = elevator;
    notifyListeners();
  }


  /// ست کردن انباری مورد نظر
 set setStoreRoom(bool storeroom) {
    currentApartemanData.storeroom = storeroom;
    notifyListeners();
  }

    /// ست کردن پارکینگ مورد نظر
 set setParking(bool parking) {
    currentApartemanData.parking = parking;
    notifyListeners();
  }

  ApartemanRentOptionModel get apartemandata {
    return _apartemandata;
  }

  /// ذخیره موقت درخواست آپارتمان قبل از ارسال به سرور
  ApartemanRentModel _currentApartemanRequest = ApartemanRentModel();

  ApartemanRentModel get currentApartemanData {
    return _currentApartemanRequest;
  }

  /// لیست وضعیت انتخاب منطقه مورد نظر
  locatationStateList() {
    if (currentApartemanData.location.length <= 1) {
      _statelist =
          apartemandata.location.map((e) => e.locationName.isEmpty).toList();
    }
    return _statelist;
  }

  /// نمایش چک لیست نهایی انتخاب کاربر
  optionShowDes(int index) {
    var _keyOfCurrent =
        _currentApartemanRequest.toJson().entries.elementAt(index);

    switch (_keyOfCurrent.key) {
      case 'buildAge':
        {
          return '${currentApartemanData.buildAge.first.buildAgeTitle} و ${currentApartemanData.buildAge.last.buildAgeTitle}';
        }
        break;

      case 'buildFloor':
        {
          return '${currentApartemanData.buildFloor.first.buildFloorTitle} تا ${currentApartemanData.buildFloor.last.buildFloorTitle}';
        }
        break;
      case 'buildroom':
        {
          return ' ${currentApartemanData.buildroom.first.buildRoomTitle} تا ${currentApartemanData.buildroom.last.buildRoomTitle}';
        }
        break;
      case 'eleveator':
        {
          return '${currentApartemanData.eleveator ? 'داشته باشد' : 'نداشته باشد'}';
        }
        break;
      case 'location':
        {
          return currentApartemanData.location
              .map(
                (text) => text.locationName + ",",
              )
              .toList();
        }
        break;
      case 'metric':
        {
          return ' ${currentApartemanData.metric.first.metricName} الی ${currentApartemanData.metric.last.metricName}';
        }
        break;
      case 'mortgagePrice':
        {
          return '${currentApartemanData.mortgagePrice.first.mortgagePriceTitle} الی ${currentApartemanData.mortgagePrice.last.mortgagePriceTitle} ';
        }
        break;
      case 'parking':
        {
          return '${currentApartemanData.parking ? 'داشته باشد' : 'نداشته باشد'}';
        }
        break;
      case 'storeroom':
        {
          return '${currentApartemanData.storeroom ? 'داشته باشد' : 'نداشته باشد'}';
        }
        break;
      case 'rentPrice':
        {
          return ' ${currentApartemanData.rentPrice.first.rentPriceTitle} الی ${currentApartemanData.rentPrice.last.rentPriceTitle}';
        }
        break;
      case 'persons':
        {
          return ' ${currentApartemanData.persons.first.personsTitle}';
        }
        break;

      default:
        {
          return Text('انتخاب کنید');
        }
        break;
    }
  }

  // optionShowDes(int index) {
  //   var _keyOfCurrent =
  //       _currentApartemanRequest.toJson().entries.elementAt(index);

  //   switch (_keyOfCurrent.key) {
  //     case 'buildAge':
  //       {
  //         return Row(
  //           children: [
  //             Text('سن بنای مورد نظر : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Text(
  //                 '${currentApartemanData.buildAge.first.buildAgeTitle} و ${currentApartemanData.buildAge.last.buildAgeTitle}'),
  //           ],
  //         );
  //       }
  //       break;

  //     case 'buildFloor':
  //       {
  //         return Row(
  //           children: [
  //             Text('طبقه مورد نظر : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Text(
  //                 '${currentApartemanData.buildFloor.first.buildFloorTitle} تا ${currentApartemanData.buildFloor.last.buildFloorTitle}'),
  //           ],
  //         );
  //       }
  //       break;
  //     case 'buildroom':
  //       {
  //         return Row(
  //           children: [
  //             Text('تعداد خواب موردنظر : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Text(
  //                 ' ${currentApartemanData.buildroom.first.buildRoomTitle} تا ${currentApartemanData.buildroom.last.buildRoomTitle}'),
  //           ],
  //         );
  //       }
  //       break;
  //     case 'eleveator':
  //       {
  //         return Row(
  //           children: [
  //             Text('آسانسور : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Text(
  //                 '${currentApartemanData.eleveator ? 'داشته باشد' : 'نداشته باشد'}'),
  //           ],
  //         );
  //       }
  //       break;
  //     case 'location':
  //       {
  //         return Row(
  //           children: [
  //             Text('منطقه مورد نظر : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Row(
  //               children: currentApartemanData.location
  //                   .map((text) => Text(
  //                         text.locationName + ",",
  //                         style: TextStyle(color: Colors.black),
  //                       ))
  //                   .toList(),
  //             ),
  //           ],
  //         );
  //       }
  //       break;
  //     case 'metric':
  //       {
  //         return Row(
  //           children: [
  //             Text('متراژ مورد نظر : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Text(
  //                 ' ${currentApartemanData.metric.first.metricName} الی ${currentApartemanData.metric.last.metricName}'),
  //           ],
  //         );
  //       }
  //       break;
  //     case 'mortgagePrice':
  //       {
  //         return Row(
  //           children: [
  //             Text('ودیعه مورد نظر  : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Text(
  //                 '${currentApartemanData.mortgagePrice.first.mortgagePriceTitle} الی ${currentApartemanData.mortgagePrice.last.mortgagePriceTitle} '),
  //           ],
  //         );
  //       }
  //       break;
  //     case 'parking':
  //       {
  //         return Row(
  //           children: [
  //             Text('پارکینگ : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Text(
  //                 '${currentApartemanData.parking ? 'داشته باشد' : 'نداشته باشد'}'),
  //           ],
  //         );
  //       }
  //       break;
  //     case 'storeroom':
  //       {
  //         return Row(
  //           children: [
  //             Text('انباری : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Text(
  //                 '${currentApartemanData.storeroom ? 'داشته باشد' : 'نداشته باشد'}'),
  //           ],
  //         );
  //       }
  //       break;
  //     case 'rentPrice':
  //       {
  //         return Row(
  //           children: [
  //             Text('اجاره مورد نظر  : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Text(
  //                 ' ${currentApartemanData.rentPrice.first.rentPriceTitle} الی ${currentApartemanData.rentPrice.last.rentPriceTitle}'),
  //           ],
  //         );
  //       }
  //       break;
  //     case 'persons':
  //       {
  //         return Row(
  //           children: [
  //             Text('تعداد نفرات : ',
  //                 style: TextStyle(
  //                     color: Colors.blueGrey, fontWeight: FontWeight.bold)),
  //             Text(' ${currentApartemanData.persons.first.personsTitle}'),
  //           ],
  //         );
  //       }
  //       break;

  //     default:
  //       {
  //         return Text('نامشخص');
  //       }
  //       break;
  //   }
  // }

  makeNewApartemanData() {
    _currentApartemanRequest = ApartemanRentModel(
      userId: '0',
      requestId: '0',
      eleveator: apartemandata.eleveator,
      parking: apartemandata.parking,
      storeroom: apartemandata.storeroom,
      persons: [apartemandata.persons.first],
      location: [apartemandata.location.first],
      metric: [apartemandata.metric.first, apartemandata.metric.last],
      buildAge: [apartemandata.buildAge.first, apartemandata.buildAge.last],
      buildFloor: [
        apartemandata.buildFloor.first,
        apartemandata.buildFloor.last
      ],
      buildroom: [apartemandata.buildroom.first, apartemandata.buildroom.first],
      rentPrice: [apartemandata.rentPrice.first, apartemandata.rentPrice.last],
      mortgagePrice: [
        apartemandata.mortgagePrice.first,
        apartemandata.mortgagePrice.last
      ],
    );
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

// ارسال درخواست به سمت سرور
Future sendRequestToServer() async {
  print("دیتا به سرور ارسال شد");
}



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
