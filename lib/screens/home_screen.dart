import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favorite_app/bloc/videos_bloc.dart';
import 'package:favorite_app/delegates/data_search.dart';
import 'package:favorite_app/widgets/video_tile.dart';
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
              onPressed: () async {
                String result =
                    await showSearch(context: context, delegate: DataSearch());
                if (result != null)
                  BlocProvider.of<VideosBloc>(context).inSearch.add(result);
              })
        ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<VideosBloc>(context).outVideos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return VideoTile(snapshot.data[index]);
              },
              itemCount: snapshot.data.length,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
