import 'dart:io';

import 'package:flutter/material.dart';
// We will be using the geolocator package for location services
import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async{
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(weatherData)));
  }

  void initState(){
    super.initState();
    getLocation();
    // Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen() ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We don't want to do anything when loading, simply call the getLocation method to go to the next page when loaded
      body: Center(
          // We can use the SpinKit library to add a spinning loading icon
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 100.0,
          )),
    );
  }
}