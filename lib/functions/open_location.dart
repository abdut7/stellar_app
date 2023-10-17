import 'package:url_launcher/url_launcher.dart';

void openLocationInMaps(double latitude, double longitude) async {
  String googleMapsUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

  if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
    launchUrl(Uri.parse(googleMapsUrl));
  } else {
    print('Could not open the location in maps');
  }
}
