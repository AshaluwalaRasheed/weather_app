import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/screens/weather.dart';
import 'package:weather/searchedcity_details.dart';
import 'package:weather/services/weather_services.dart';

class SeacrhedCityScreen extends StatefulWidget {
  const SeacrhedCityScreen({super.key, required this.city});

  final String city;

  @override
  State<SeacrhedCityScreen> createState() => _SeacrhedCityScreenState();
}

class _SeacrhedCityScreenState extends State<SeacrhedCityScreen> {
   Weather? weatherInfo;

 Future<void> getWeather(String city) async {
    
    final value = await WeatherServices().fetchWeatherByCty(city);
    setState(() {
      weatherInfo = value;
    });
    
  }

  @override
  void initState() {
    getWeather(widget.city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (weatherInfo == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(title: Text('Weather'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 57, 128, 252),
                    const Color.fromARGB(255, 3, 226, 255),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: SearchedCityDetails(weather: weatherInfo!),
            ),
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text('7 days', style: TextStyle(color: Colors.black),),
                icon: Icon(Icons.navigate_next, color: Colors.black),
                iconAlignment: IconAlignment.end,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
