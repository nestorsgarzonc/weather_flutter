import 'package:flutter/material.dart';
import 'package:weather_flutter/services/weather.dart';
import 'package:weather_flutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationScreen;
  LocationScreen({this.locationScreen});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  var temperature;
  int condition;
  String cityName;
  String weatherIcon;
  String weatherMessage;

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = '';
      weatherMessage = 'Unable to get location';
    } else {
      setState(() {
        temperature = weatherData['main']['temp'].round();
        condition = weatherData['weather'][0]['id'];
        cityName = weatherData['name'];
        weatherIcon = weatherModel.getWeatherIcon(condition);
        weatherMessage = weatherModel.getMessage(temperature);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.85),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Icon(Icons.near_me, size: 50.0),
                    onPressed: () {
                      setState(() async{
                        var weatherData = await weatherModel.getLocationWeather();
                        updateUI(weatherData);
                      });
                    },
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.pushNamed(context, 'cityScreen');
                      if(typedName!=null){
                        var weatherData= await weatherModel.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(Icons.location_city, size: 50),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text('$temperature°', style: kTempTextStyle),
                    Text(weatherIcon, style: kConditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  ('$weatherMessage in $cityName'),
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
