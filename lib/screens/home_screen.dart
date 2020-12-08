import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          "assets/icons/youtube.svg",
          width: 75.0,
          height: 75.0,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Align(alignment: Alignment.center, child: Text("0")),
          IconButton(
            icon: Icon(Icons.star_outline),
            onPressed: () {},
          ),
          IconButton(icon: Icon(Icons.search_outlined), onPressed: () {})
        ],
      ),
    );
  }
}
