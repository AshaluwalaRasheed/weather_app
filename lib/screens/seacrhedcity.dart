import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
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
      appBar: AppBar(title: Text('Weather')),
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
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 110,
                  width: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 57, 128, 252),
                        const Color.fromARGB(255, 3, 226, 255),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '+1hr',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.cloud_circle_sharp, color: Colors.white),
                      Text(
                        '${weatherInfo!.temperature.toStringAsFixed(0)}°',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  width: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 57, 128, 252),
                        const Color.fromARGB(255, 3, 226, 255),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '+2hr',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.cloud, color: Colors.white),
                      Text(
                        '${(weatherInfo!.temperature + 1).toStringAsFixed(0)}°',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  width: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 57, 128, 252),
                        const Color.fromARGB(255, 3, 226, 255),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '+3hr',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.cloud_sharp, color: Colors.white),
                      Text(
                        '${(weatherInfo!.temperature + 1).toStringAsFixed(0)}°',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  width: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 57, 128, 252),
                        const Color.fromARGB(255, 3, 226, 255),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '+4hr',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.thunderstorm_rounded, color: Colors.white),
                      Text(
                        '${(weatherInfo!.temperature - 1).toStringAsFixed(0)}°',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
