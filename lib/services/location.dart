import 'package:geolocator/geolocator.dart';

class LocationWeather {
  LocationWeather();
  double latitude;
  double longitude;
  Position position;

  getCurrentLocation() async {
    try {
      position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.latitude ?? 0;
      longitude = position.longitude ?? 0;
    } catch (e) {
      print(e);
    }
  }
}
