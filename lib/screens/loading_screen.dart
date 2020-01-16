import 'package:flutter/material.dart';
import 'package:weather_flutter/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final locationN = LocationWeather();
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    await locationN.getCurrentLocation();
    print(locationN.latitude);
    print(locationN.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          child: Text('Get location'),
        ),
      ),
    );
  }
}
