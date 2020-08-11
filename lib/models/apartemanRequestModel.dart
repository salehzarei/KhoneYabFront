// To parse this JSON data, do
//
//     final apartemanRentModel = apartemanRentModelFromJson(jsonString);

// import 'dart:convert';

// ApartemanRentModel apartemanRentModelFromJson(String str) => ApartemanRentModel.fromJson(json.decode(str));

// String apartemanRentModelToJson(ApartemanRentModel data) => json.encode(data.toJson());

class ApartemanRentModel {
  ApartemanRentModel({
    this.location,
    this.eleveator,
    this.storeroom,
    this.parking,
    this.metric,
    this.mortgagePrice,
    this.rentPrice,
    this.buildAge,
    this.buildFloor,
    this.buildroom,
    this.persons,
    this.userId,
    this.requestId,
  });

  final List<String> location;
  final bool eleveator;
  final bool storeroom;
  final bool parking;
  final List<String> metric;
  final List<String> mortgagePrice;
  final List<String> rentPrice;
  final List<String> buildAge;
  final List<String> buildFloor;
  final List<String> buildroom;
  final String persons;
  final String userId;
  final String requestId;

  factory ApartemanRentModel.fromJson(Map<String, dynamic> json) =>
      ApartemanRentModel(
        location: List<String>.from(json["location"].map((x) => x)),
        eleveator: json["eleveator"],
        storeroom: json["storeroom"],
        parking: json["parking"],
        metric: List<String>.from(json["metric"].map((x) => x)),
        mortgagePrice: List<String>.from(json["mortgagePrice"].map((x) => x)),
        rentPrice: List<String>.from(json["rentPrice"].map((x) => x)),
        buildAge: List<String>.from(json["buildAge"].map((x) => x)),
        buildFloor: List<String>.from(json["buildFloor"].map((x) => x)),
        buildroom: List<String>.from(json["buildroom"].map((x) => x)),
        persons: json["persons"],
        userId: json["userId"],
        requestId: json["requestId"],
      );

  Map<String, dynamic> toJson() => {
        "location": List<dynamic>.from(location.map((x) => x)),
        "eleveator": eleveator,
        "storeroom": storeroom,
        "parking": parking,
        "metric": List<dynamic>.from(metric.map((x) => x)),
        "mortgagePrice": List<dynamic>.from(mortgagePrice.map((x) => x)),
        "rentPrice": List<dynamic>.from(rentPrice.map((x) => x)),
        "buildAge": List<dynamic>.from(buildAge.map((x) => x)),
        "buildFloor": List<dynamic>.from(buildFloor.map((x) => x)),
        "buildroom": List<dynamic>.from(buildroom.map((x) => x)),
        "persons": persons,
        "userId": userId,
        "requestId": requestId,
      };
}
