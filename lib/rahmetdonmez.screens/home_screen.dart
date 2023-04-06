import 'package:flutter/material.dart';
import 'package:hava_durumu/rahmetdonmez.api/weather.dart';

import '../rahmetdonmez.utils/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.weather});
  final Weather weather;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String backgroundimg;
  late IconData icon;
  late String icon_url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (DateTime.now().hour > 19) {
      backgroundimg = "assets/gece.jpg";
    } else {
      backgroundimg = "assets/gunduz.jpg";
    }
    icon_url =
        "https://openweathermap.org/img/wn/${widget.weather.icon_url}@2x.png";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backgroundimg),
            fit: BoxFit.cover //arkaplanın ekrana dolmasını sağlar

            ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.network(icon_url),

          SizedBox(
            height: 10,
          ),
          Text(widget.weather.description,
              style: TextStyle(color: Color.fromARGB(255, 36, 152, 247))),
          SizedBox(
            height: 10,
          ),
          Text(widget.weather.temp.round().toString() + "°",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 87, 166, 212))),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.weather.city,
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
