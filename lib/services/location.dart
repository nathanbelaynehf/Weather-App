import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future getCurrentLocation() async {
    try {
      // Request permission first
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        // Get the current position
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
      } else {
        print('Location permission denied');
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }
}
