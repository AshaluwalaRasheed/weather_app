import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/screens/SeacrhedCity.dart';
import 'package:weather/services/weather_services.dart';
import 'package:weather/weather_details.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather? weatherInfo;
  final cityController = TextEditingController();

  getWeather() async {
    final value = await WeatherServices().fecthWeather();
    setState(() {
      weatherInfo = value;
    });
  }

  void openWeatherScreen(String city) {
    final enteredCity = cityController.text;
    if (enteredCity.trim().isEmpty) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SeacrhedCityScreen(city: cityController.text);
        },
      ),
    );
    
    // cityController.clear();
  }
  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (weatherInfo == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather', style: TextStyle(color: Colors.white54)),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: BoxBorder.all(),
                  color: const Color.fromARGB(255, 46, 44, 44),
                ),
                child: TextField(
                  controller: cityController,
                  cursorColor: Colors.grey,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 46, 44, 44),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 46, 44, 44),
                      ),
                    ),
                    hintText: 'Search a city',
                    suffixIcon: TextButton.icon(
                      label: Text(
                        'Search',
                        style: TextStyle(color: Colors.white70),
                      ),
                      onPressed: () {
                        openWeatherScreen(cityController.text);
                      },
                      icon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 490,
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
                child: WeatherDetails(weather: weatherInfo!),
              ),
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromARGB(255, 255, 246, 246),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    '7 days',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 246, 246),
                    ),
                  ),
                  icon: Icon(
                    Icons.navigate_next,
                    color: const Color.fromARGB(255, 255, 246, 246),
                  ),
                  iconAlignment: IconAlignment.end,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
