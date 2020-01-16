import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_flutter/services/location.dart';
import 'package:http/http.dart' as http;

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
    getData();
  }

  void getLocation() async {
    await locationN.getCurrentLocation();
    print(locationN.latitude);
    print(locationN.longitude);
  }

  void getData() async {
    String data;
    http.Response response;
    response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=4&lon=74&appid=b6907d289e10d714a6e88b30761fae22');
    if (response.statusCode == 200) {
      data = response.body;
      var decodedData = jsonDecode(data);
      var lon = decodedData['coord']['lon'].toString();
      var temperature = decodedData['main']['temp'].toString();
      var condition = decodedData['name'];
      print(lon + ' lon');
      print(temperature + ' temperature');
      print(condition + ' condition');
    } else {
      print(response.statusCode);
    }
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
