import 'package:favorite_app/api.dart';
import 'package:favorite_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {

  Api api = Api();

  api.search("Clodoaldo").toString();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
