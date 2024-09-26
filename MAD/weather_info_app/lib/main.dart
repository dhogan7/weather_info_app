import 'dart:math'; // To generate random numbers
import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherService {
  // Function to simulate fetching weather data
  Map<String, String> fetchWeatherData(String cityName) {
    final Random random = Random();
    final List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];

    // Generate a random temperature between 15°C and 30°C
    String temperature = '${15 + random.nextInt(16)}°C';

    // Randomly select a weather condition
    String weatherCondition = weatherConditions[random.nextInt(3)];

    // Return the simulated weather data as a map
    return {
      'city': cityName,
      'temperature': temperature,
      'condition': weatherCondition,
    };
  }
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

  final Random random = Random();
  final List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];

  void fetchWeather() {
    // Simulate fetching weather data
    setState(() {
      temperature = '${(15 + random.nextInt(16)).toString()}°C'; // Random temperature between 15°C and 30°C
      weatherCondition = weatherConditions[random.nextInt(3)]; // Random weather condition
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
              onPressed: () {
                if (cityName.isNotEmpty) {
                  fetchWeather();
                }
              },
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text(
              'City: ${cityName.isEmpty ? 'Enter a city' : cityName}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Temperature: $temperature',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Weather Condition: $weatherCondition',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}


