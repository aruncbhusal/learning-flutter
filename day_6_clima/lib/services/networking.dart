import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper({required this.url}){}

  final String url;

  Future getData() async{
    // We will be using the OpenWeatherMap API to get weather for our coords
    // Thankfully I already have an OWA account
    // Also had to edit android manifest to add internet permission
    http.Response response = await http.get(Uri.parse(this.url));
    if (response.statusCode == 200){
      // print(response.body);
      // print('Weather id: $weatherid, temperature: $temp, city: $city');
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      return {'error': response.statusCode};
    }
  }
}