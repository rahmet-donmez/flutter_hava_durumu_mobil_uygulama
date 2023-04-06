import 'dart:convert';

import 'package:hava_durumu/rahmetdonmez.utils/location.dart';
import 'package:http/http.dart';

class Weather {
  String durum = "";
  String city = "";
  String description = "";
  late int weather_id;
  late double temp = 0;
  String icon_url = "";
  final String apiKey = "0796bfe9e5f3e88bc46512248bf3aeb1";

  getWeather(LocationService location) async {
    Response response = await post(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longtude}&appid=${apiKey}&units=metric&lang=tr'));
    var request = jsonDecode(response.body.toString());

    durum = request['weather'][0]['main'];
    weather_id = request['weather'][0]['id'];
    description = request['weather'][0]['description'];
    icon_url = request['weather'][0]['icon'];
    temp = request['main']['temp'];
    city = request['name'];
  }
}
