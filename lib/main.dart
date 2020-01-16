import 'package:flutter/material.dart';
import 'package:weather_flutter/screens/city_screen.dart';
import 'package:weather_flutter/screens/loading_screen.dart';
import 'package:weather_flutter/screens/location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      initialRoute: 'loadingScreen',
      routes: {
        'cityScreen': (BuildContext context) => CityScreen(),
        'locationScreen': (BuildContext context) => LocationScreen(),
        'loadingScreen': (BuildContext context) => LoadingScreen()
      },
    );
  }
}
