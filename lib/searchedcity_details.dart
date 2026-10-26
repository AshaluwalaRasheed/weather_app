import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:intl/intl.dart';

class SearchedCityDetails extends StatelessWidget {
   SearchedCityDetails({super.key, required this.weather});

  final Weather weather;
  final formatter = DateFormat('EEEE, MMM d').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_pin, color: Colors.white),
              Text(
                weather.city,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: ClipRect(
              child: Transform.scale(
                scale: 1.7,
                child: Image.network(
                  'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                  width: 150,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${weather.temperature.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 84,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '°',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 80,
                ),
              ),
            ],
          ),
          Text(
            weather.description,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            formatter,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.wind_power_outlined, color: Colors.white),
                    Text(
                      "${weather.wind.toStringAsFixed(0)} km/h",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Wind',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.water_drop_outlined,
                      color: const Color.fromARGB(255, 230, 238, 255),
                    ),
                    Text(
                      '${weather.humidity.toStringAsFixed(0)}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Humidity',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.air_sharp, color: Colors.white),
                    Text(
                      '${weather.pressure.toString()} hPa',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Pressure',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
}