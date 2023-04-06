import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hava_durumu/rahmetdonmez.api/weather.dart';
import 'package:hava_durumu/rahmetdonmez.screens/home_screen.dart';

import '../rahmetdonmez.utils/location.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late LocationService location;
  late Weather weather;
  getLocation() async {
    location = LocationService();
    await location.getLocation();
  }

  getWeather() async {
    await getLocation();

    weather = Weather();
    await weather.getWeather(location);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  weather: weather,
                )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft, //renk geçişinin başladığı konum
                end: Alignment.bottomRight, //renk geçişinin bittiği konum
                colors: [
              Color.fromARGB(255, 242, 243, 153),
              Color.fromARGB(255, 80, 168, 240)
            ])),
        child: Center(
            child: SpinKitHourGlass(
          //yükleniyor ikonu
          color: Colors.white,
          duration: Duration(
              milliseconds: 5000), //hangi süreyle hareket edeceğini belirler
        )));
  }
}
