import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SizedBox(
            height: 130.00,
            width: 130.00,
            child: Image.asset("assets/images/logo.png")),
      ),
    );
  }
}
