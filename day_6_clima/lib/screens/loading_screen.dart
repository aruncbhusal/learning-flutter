import 'package:flutter/material.dart';
// We will be using the geolocator package for location services
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async{
    Position position = await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.low));
    // for this to work we must request for permission in both Android and iOS
    // for android we need to edit the AndroidManifest.xml and add lines to <manifest> tag
    // for iOS we need to edit the Info.plist
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
