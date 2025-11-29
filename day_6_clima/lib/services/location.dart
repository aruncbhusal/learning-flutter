import 'package:geolocator/geolocator.dart';

class Location {

  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.low));
      // for this to work we must request for permission in both Android and iOS
      // for android we need to edit the AndroidManifest.xml and add lines to <manifest> tag
      // for iOS we need to edit the Info.plist
      print(position);
      this.latitude = position.latitude;
      this.longitude = position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}