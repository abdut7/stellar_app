class GetNearbyPeopleModel {
  final bool success;
  final String message;
  final int statusCode;
  final List<Person> arrList;

  GetNearbyPeopleModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.arrList,
  });

  factory GetNearbyPeopleModel.fromJson(Map<String, dynamic> json) {
    final List<Person> people = (json['arrList'] as List)
        .map((personJson) => Person.fromJson(personJson))
        .toList();

    return GetNearbyPeopleModel(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      arrList: people,
    );
  }
}

class Person {
  final String id;
  final String strFullName;
  final String strMobileNo;
  final String strEmail;
  final String strProfileUrl;
  final Location location;

  Person({
    required this.id,
    required this.strFullName,
    required this.strMobileNo,
    required this.strEmail,
    required this.strProfileUrl,
    required this.location,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['_id'],
      strFullName: json['strFullName'],
      strMobileNo: json['strMobileNo'],
      strEmail: json['strEmail'],
      strProfileUrl: json['strProfileUrl'],
      location: Location.fromJson(json['location']),
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates: List<double>.from(
        json['coordinates'].map((coordinate) => coordinate is String
            ? double.parse(coordinate)
            : coordinate.toDouble(),
        ),
      ),
    );
  }
}
