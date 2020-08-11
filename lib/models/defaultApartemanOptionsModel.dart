// To parse this JSON data, do
// از سایت https://app.quicktype.io/ برای ساخت این صفحه 
//     final apartemanRentModel = apartemanRentModelFromJson(jsonString);

// import 'dart:convert';

// ApartemanRentModel apartemanRentModelFromJson(String str) => ApartemanRentModel.fromJson(json.decode(str));

// String apartemanRentModelToJson(ApartemanRentModel data) => json.encode(data.toJson());

class ApartemanRentOptionModel {
    ApartemanRentOptionModel({
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
    });

    List<Location> location;
    bool eleveator;
    bool storeroom;
    bool parking;
    List<Metric> metric;
    List<MortgagePrice> mortgagePrice;
    List<RentPrice> rentPrice;
    List<BuildAge> buildAge;
    List<BuildFloor> buildFloor;
    List<Buildroom> buildroom;
    List<Person> persons;

    factory ApartemanRentOptionModel.fromJson(Map<String, dynamic> json) => ApartemanRentOptionModel(
        location: List<Location>.from(json["location"].map((x) => Location.fromJson(x))),
        eleveator: json["eleveator"],
        storeroom: json["storeroom"],
        parking: json["parking"],
        metric: List<Metric>.from(json["metric"].map((x) => Metric.fromJson(x))),
        mortgagePrice: List<MortgagePrice>.from(json["mortgagePrice"].map((x) => MortgagePrice.fromJson(x))),
        rentPrice: List<RentPrice>.from(json["rentPrice"].map((x) => RentPrice.fromJson(x))),
        buildAge: List<BuildAge>.from(json["buildAge"].map((x) => BuildAge.fromJson(x))),
        buildFloor: List<BuildFloor>.from(json["buildFloor"].map((x) => BuildFloor.fromJson(x))),
        buildroom: List<Buildroom>.from(json["buildroom"].map((x) => Buildroom.fromJson(x))),
        persons: List<Person>.from(json["persons"].map((x) => Person.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "location": List<dynamic>.from(location.map((x) => x.toJson())),
        "eleveator": eleveator,
        "storeroom": storeroom,
        "parking": parking,
        "metric": List<dynamic>.from(metric.map((x) => x.toJson())),
        "mortgagePrice": List<dynamic>.from(mortgagePrice.map((x) => x.toJson())),
        "rentPrice": List<dynamic>.from(rentPrice.map((x) => x.toJson())),
        "buildAge": List<dynamic>.from(buildAge.map((x) => x.toJson())),
        "buildFloor": List<dynamic>.from(buildFloor.map((x) => x.toJson())),
        "buildroom": List<dynamic>.from(buildroom.map((x) => x.toJson())),
        "persons": List<dynamic>.from(persons.map((x) => x.toJson())),
    };
}

class BuildAge {
    BuildAge({
        this.buildAgeId,
        this.buildAgeTitle,
        this.buildAgeValue,
    });

    String buildAgeId;
    String buildAgeTitle;
    int buildAgeValue;

    factory BuildAge.fromJson(Map<String, dynamic> json) => BuildAge(
        buildAgeId: json["buildAgeID"],
        buildAgeTitle: json["buildAgeTitle"],
        buildAgeValue: json["buildAgeValue"],
    );

    Map<String, dynamic> toJson() => {
        "buildAgeID": buildAgeId,
        "buildAgeTitle": buildAgeTitle,
        "buildAgeValue": buildAgeValue,
    };
}

class BuildFloor {
    BuildFloor({
        this.buildFloorId,
        this.buildFloorTitle,
        this.buildFloorValue,
    });

    String buildFloorId;
    String buildFloorTitle;
    int buildFloorValue;

    factory BuildFloor.fromJson(Map<String, dynamic> json) => BuildFloor(
        buildFloorId: json["buildFloorID"],
        buildFloorTitle: json["buildFloorTitle"],
        buildFloorValue: json["buildFloorValue"],
    );

    Map<String, dynamic> toJson() => {
        "buildFloorID": buildFloorId,
        "buildFloorTitle": buildFloorTitle,
        "buildFloorValue": buildFloorValue,
    };
}

class Buildroom {
    Buildroom({
        this.buildRoomId,
        this.buildRoomTitle,
        this.buildRoomValue,
    });

    String buildRoomId;
    String buildRoomTitle;
    int buildRoomValue;

    factory Buildroom.fromJson(Map<String, dynamic> json) => Buildroom(
        buildRoomId: json["buildRoomID"],
        buildRoomTitle: json["buildRoomTitle"],
        buildRoomValue: json["buildRoomValue"],
    );

    Map<String, dynamic> toJson() => {
        "buildRoomID": buildRoomId,
        "buildRoomTitle": buildRoomTitle,
        "buildRoomValue": buildRoomValue,
    };
}

class Location {
    Location({
        this.locationId,
        this.locationName,
    });

    String locationId;
    String locationName;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        locationId: json["locationID"],
        locationName: json["locationName"],
    );

    Map<String, dynamic> toJson() => {
        "locationID": locationId,
        "locationName": locationName,
    };
}

class Metric {
    Metric({
        this.metricId,
        this.metricName,
        this.metricValue,
    });

    String metricId;
    String metricName;
    int metricValue;

    factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        metricId: json["metricID"],
        metricName: json["metricName"],
        metricValue: json["metricValue"],
    );

    Map<String, dynamic> toJson() => {
        "metricID": metricId,
        "metricName": metricName,
        "metricValue": metricValue,
    };
}

class MortgagePrice {
    MortgagePrice({
        this.mortgagePriceId,
        this.mortgagePriceTitle,
        this.mortgagePriceValuen,
    });

    String mortgagePriceId;
    String mortgagePriceTitle;
    int mortgagePriceValuen;

    factory MortgagePrice.fromJson(Map<String, dynamic> json) => MortgagePrice(
        mortgagePriceId: json["mortgagePriceID"],
        mortgagePriceTitle: json["mortgagePriceTitle"],
        mortgagePriceValuen: json["mortgagePriceValuen"],
    );

    Map<String, dynamic> toJson() => {
        "mortgagePriceID": mortgagePriceId,
        "mortgagePriceTitle": mortgagePriceTitle,
        "mortgagePriceValuen": mortgagePriceValuen,
    };
}

class Person {
    Person({
        this.personsId,
        this.personsTitle,
        this.personsValue,
    });

    String personsId;
    String personsTitle;
    String personsValue;

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        personsId: json["personsID"],
        personsTitle: json["personsTitle"],
        personsValue: json["personsValue"],
    );

    Map<String, dynamic> toJson() => {
        "personsID": personsId,
        "personsTitle": personsTitle,
        "personsValue": personsValue,
    };
}

class RentPrice {
    RentPrice({
        this.rentPriceId,
        this.rentPriceTitle,
        this.rentPriceValue,
    });

    String rentPriceId;
    String rentPriceTitle;
    double rentPriceValue;

    factory RentPrice.fromJson(Map<String, dynamic> json) => RentPrice(
        rentPriceId: json["rentPriceID"],
        rentPriceTitle: json["rentPriceTitle"],
        rentPriceValue: json["rentPriceValue"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "rentPriceID": rentPriceId,
        "rentPriceTitle": rentPriceTitle,
        "rentPriceValue": rentPriceValue,
    };
}
