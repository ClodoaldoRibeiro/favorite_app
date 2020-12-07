import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.black,
      child: Center(
        child: SizedBox(
            height: 120.00,
            width: 120.00,
            child: Image.asset("assets/images/youtube.png")),
      ),
    ));
  }
}
