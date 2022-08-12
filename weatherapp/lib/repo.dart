import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/weather_model.dart';

class Repo {
  getWeather(String? city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=fc01c173f257e8b5b606f8771a1e900d";

    final res = await http.get(Uri.parse(url));

    var resBody = res.body;
   // print(resBody);
    try {
      if (res.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(resBody));
      }
    } catch (e) {
      throw Exception();
    }
  }
}
