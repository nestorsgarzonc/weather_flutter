import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_flutter/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:weather_flutter/services/networking.dart';
import 'package:weather_flutter/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final locationN = LocationWeather();
  double longitudeGPS;
  double latitudeGPS;
  String url;
  var weatherData;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    await locationN.getCurrentLocation();
    latitudeGPS = locationN.latitude;
    longitudeGPS = locationN.longitude;
    url='https://api.openweathermap.org/data/2.5/weather?lat=$latitudeGPS&lon=$longitudeGPS&appid=$apiKeyWeather';
    final networkHelper= NetworkHelper(url: url);
    weatherData=await networkHelper.getData();
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
