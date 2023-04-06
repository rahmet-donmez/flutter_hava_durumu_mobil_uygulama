import 'package:flutter/material.dart';
import 'package:hava_durumu/rahmetdonmez.screens/home_screen.dart';
import 'package:hava_durumu/rahmetdonmez.screens/loding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu',
      debugShowCheckedModeBanner: false,//debug modda sağ üst köşedeki debug yazısını kapatır
      theme: ThemeData(primaryColor: Colors.blue),//koyu tema
      home:LoadingPage()
    );
  }
}

