class Weather {
  Weather({
    required this.city,
    required this.icon,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.pressure,
  });

  final String city;
  final String icon;
  final String description;
  final double temperature;
  final int humidity;
  final double wind;
  final int pressure;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      icon: json['weather'][0]['icon'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      humidity: json['main']['humidity'],
      wind: json['wind']['speed'],
      pressure: json['main']['pressure'],
    );
  }
}
