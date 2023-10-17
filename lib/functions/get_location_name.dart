import 'package:geocode/geocode.dart';



Future<String> getLocationName(double? lat, double? lang) async {
 if (lat == null || lang == null) return "";
 GeoCode geoCode = GeoCode();
 Address address =
     await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
 return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
}
