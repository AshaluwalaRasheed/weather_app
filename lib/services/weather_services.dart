import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:weather/model/weather.dart';

class WeatherServices {
  final String apiKey = '2ff38a56cd68c38e4afcf66bc88e1b67';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  fecthWeather() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lon = locationData.longitude;

    final response = await http.get(
      Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=imperial'),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else if(response.statusCode > 400) {
      throw Exception('Failed to fetch weather');
    }
  }
  fetchWeatherByCty(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=${city.trim()}&appid=$apiKey&units=imperial'),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } if(response.statusCode > 400) {
      throw Exception('Failed to fetch weather');
    }
    if (response.body == 'null') {
      throw Exception('Failed to fetch weather');
    }
  }
}
