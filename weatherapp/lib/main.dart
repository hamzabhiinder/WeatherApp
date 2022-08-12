import 'package:flutter/material.dart';
import 'package:weatherapp/repo.dart';
import 'package:weatherapp/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
            ),
            ElevatedButton(
              onPressed: () async {
                weatherModel = await Repo().getWeather(_controller.text);
                print(weatherModel?.main?.tempMin);
                setState(() {});
              },
              child: const Text('Search'),
            ),
            Card(
              elevation: 5,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    // Text('Temp     ${weatherModel?.main!.temp}'),
                    // Text('Max Temp ${weatherModel?.main!.tempMax}'),
                    // Text('Min Temp ${weatherModel?.main!.tempMin}'),
                    // Text('Hueraturemidity ${weatherModel?.main!.humidity}'),
                    // Text('Feel like ${weatherModel?.main!.feelsLike}'),
                    Weathers('Temp     : ', '${weatherModel?.main!.temp}'),
                    Weathers('Max Temp : ', '${weatherModel?.main!.tempMax}'),
                    Weathers('Min Temp : ', '${weatherModel?.main!.tempMin}'),
                    Weathers('Humidity : ', '${weatherModel?.main!.humidity}'),
                    Weathers('Feel Like: ', '${weatherModel?.main!.feelsLike}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Weathers(String field_name, String temp) {
    return Card(
        child: Container(
      color: Colors.deepPurple[700],
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                field_name,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                temp,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
