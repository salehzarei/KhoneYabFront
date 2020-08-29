// To parse this JSON data, do
//
//     final apartemanRentModel = apartemanRentModelFromJson(jsonString);

// import 'dart:convert';

// ApartemanRentModel apartemanRentModelFromJson(String str) => ApartemanRentModel.fromJson(json.decode(str));

// String apartemanRentModelToJson(ApartemanRentModel data) => json.encode(data.toJson());

import 'defaultApartemanOptionsModel.dart';

class ApartemanRentModel extends ApartemanRentOptionModel {
  final String userId;
  final String requestId;

  ApartemanRentModel(
      {this.userId,
      this.requestId,
      List<Location> location,
      List<Metric> metric,
      List<MortgagePrice> mortgagePrice,
      List<RentPrice> rentPrice,
      List<BuildAge> buildAge,
      List<BuildFloor> buildFloor,
      List<Buildroom> buildroom,
      List<Person> persons,
      bool eleveator,
      bool storeroom,
      bool parking})
      : super(
            location: location,
            metric: metric,
            mortgagePrice: mortgagePrice,
            rentPrice: rentPrice,
            buildAge: buildAge,
            buildFloor: buildFloor,
            buildroom: buildroom,
            persons: persons,
            eleveator: eleveator,
            storeroom: storeroom,
            parking: parking);
}

// class ApartemanRentModel {
//   ApartemanRentModel({
//     this.location,
//     this.metric,
//     this.mortgagePrice,
//     this.rentPrice,
//     this.buildAge,
//     this.buildFloor,
//     this.buildroom,
//     this.persons,
//     this.eleveator,
//     this.storeroom,
//     this.parking,
//     this.userId,
//     this.requestId,
//   });

//   final List<String> location;

//   final List<String> metric;
//   final List<String> mortgagePrice;
//   final List<String> rentPrice;
//   final List<String> buildAge;
//   final List<String> buildFloor;
//   final List<String> buildroom;
//   final String persons;
//   final bool eleveator;
//   final bool storeroom;
//   final bool parking;
//   final String userId;
//   final String requestId;

//   factory ApartemanRentModel.fromJson(Map<String, dynamic> json) =>
//       ApartemanRentModel(
//         location: List<String>.from(json["location"].map((x) => x)),
//         metric: List<String>.from(json["metric"].map((x) => x)),
//         mortgagePrice: List<String>.from(json["mortgagePrice"].map((x) => x)),
//         rentPrice: List<String>.from(json["rentPrice"].map((x) => x)),
//         buildAge: List<String>.from(json["buildAge"].map((x) => x)),
//         buildFloor: List<String>.from(json["buildFloor"].map((x) => x)),
//         buildroom: List<String>.from(json["buildroom"].map((x) => x)),
//         persons: json["persons"],
//         eleveator: json["eleveator"],
//         storeroom: json["storeroom"],
//         parking: json["parking"],
//         userId: json["userId"],
//         requestId: json["requestId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "location": List<dynamic>.from(location.map((x) => x)),
//         "metric": List<dynamic>.from(metric.map((x) => x)),
//         "mortgagePrice": List<dynamic>.from(mortgagePrice.map((x) => x)),
//         "rentPrice": List<dynamic>.from(rentPrice.map((x) => x)),
//         "buildAge": List<dynamic>.from(buildAge.map((x) => x)),
//         "buildFloor": List<dynamic>.from(buildFloor.map((x) => x)),
//         "buildroom": List<dynamic>.from(buildroom.map((x) => x)),
//         "persons": persons,
//         "eleveator": eleveator,
//         "storeroom": storeroom,
//         "parking": parking,
//         "userId": userId,
//         "requestId": requestId,
//       };
// }
