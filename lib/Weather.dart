import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  late String _apiKey;
  late String _city;
  late String _weatherDescription;
  late double _temperature;

  @override
  void initState() {
    super.initState();
    _apiKey = '28d4fda4987470aeadaf01e27ec39eee';
    _city = 'Toronto';
    _weatherDescription = '';
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    final apiKeyParam = 'apiKey=$_apiKey';
    final cityParam = 'q=$_city';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?$cityParam&$apiKeyParam';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      setState(() {
        _weatherDescription = data['weather'][0]['description'];
        _temperature =
            (data['main']['temp'] - 273.15); // Convert Kelvin to Celsius
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'City: $_city',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Weather: $_weatherDescription',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Text(
                'Temperature: ${_temperature.toStringAsFixed(2)}°C',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
