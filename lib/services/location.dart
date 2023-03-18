import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;
  Position position;
  Future<void> getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print('geolocator Issue');
      print(e);
    }
  }
}
