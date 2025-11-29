import 'package:clima/utilities/constants.dart';

import 'location.dart';
import 'networking.dart';
import '../utilities/constants.dart';

class WeatherModel {

  Future<dynamic> getCityWeather(city) async {
    // Since geocoding API has been retired, we need to make two API calls here, one to get latlong, then again to get weather request. How about we do this:
    // print('Looking for $city');
    NetworkHelper networkHelper = NetworkHelper(url: 'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=$OWA_API_KEY');
    var locationData = await networkHelper.getData();
    return await getLocationWeather(getLocation: false, lat: locationData[0]['lat'], long: locationData[0]['lon']);
  }

  Future<dynamic> getLocationWeather({bool? getLocation, double? lat, double? long}) async{
    // Now I have to modify this function just because I want to reuse it. I could simply copy the logic over, but in the process of DRY, I made it even longer
    Location locatorLocation = Location();
    if (getLocation??true) {
      await locatorLocation.getCurrentLocation();
    }
    var location = {
        'latitude': lat??locatorLocation.latitude??0,
        'longitude': long??locatorLocation.longitude??0
    };

    // Since we can't make initState async, we have to use it here.
    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=${location['latitude']??0}&lon=${location['longitude']??0}&appid=$OWA_API_KEY&units=metric');
    // We can wrap the string interpolated expressions inside curly brackets since we can't use object notations normally interpolated.
    var weatherData = await networkHelper.getData();
    print(weatherData);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 25) {
      return 'Time for shorts and 👕';
    } else if (temp < 15) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
