import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kTempTextStyle = GoogleFonts.amiko(fontSize: 100);
final kMessageTextStyle = GoogleFonts.amiko(fontSize: 60);
final kButtonTextStyle = GoogleFonts.amiko(fontSize: 30);
final kConditionTextStyle = GoogleFonts.amiko(fontSize: 100);
final kTextFieldTextStyle = GoogleFonts.amiko(color: Colors.black);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white),
  hintText: 'Enter city name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none),
);

const apiKeyWeather = '3ec20458079762f57a52d0f8bbea0935';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
