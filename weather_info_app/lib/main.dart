import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomeScreen(),
    );
  }
}

class WeatherHomeScreen extends StatefulWidget {
  @override
  _WeatherHomeScreenState createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  String cityName = '';
  String temperature = '';
  String weatherCondition = '';

  void fetchWeather() {
    // Simulate fetching weather data
    setState(() {
      cityName = 'Sample City'; // Replace with user input
      temperature = '${(15 + (30 - 15) * (0.5)).toStringAsFixed(1)}°C'; // Random temperature
      weatherCondition = 'Sunny'; // Random condition
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter City Name'),
              onChanged: (value) {
                cityName = value;
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text('City: $cityName'),
            Text('Temperature: $temperature'),
            Text('Weather Condition: $weatherCondition'),
          ],
        ),
      ),
    );
  }
}

