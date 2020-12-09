import 'package:favorite_app/delegates/data_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            width: 95.0, child: Image.asset("assets/images/home.png")),
        elevation: 5,
        backgroundColor: Colors.white,
        actions: [
          Align(alignment: Alignment.center, child: Text("0")),
          IconButton(
            icon: Icon(Icons.star_outline),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
    );
  }
}
