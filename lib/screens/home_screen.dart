import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favorite_app/bloc/favorite_bloc.dart';
import 'package:favorite_app/bloc/videos_bloc.dart';
import 'package:favorite_app/delegates/data_search.dart';
import 'package:favorite_app/models/video.dart';
import 'package:favorite_app/widgets/video_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<VideosBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Container(
            width: 95.0, child: Image.asset("assets/images/home.png")),
        elevation: 5,
        backgroundColor: Colors.white,
        actions: [
          Align(
            alignment: Alignment.center,
            child: StreamBuilder<Map<String, Video>>(
              initialData: {},
              stream: BlocProvider.of<FavoriteBloc>(context).outFav,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data.length}");
                } else {
                  return Container();
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.star_outline),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () async {
                String result =
                    await showSearch(context: context, delegate: DataSearch());
                if (result != null) bloc.inSearch.add(result);
              })
        ],
      ),
      body: StreamBuilder(
        initialData: [],
        stream: bloc.outVideos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return VideoTile(snapshot.data[index]);
                } else if (index > 1) {
                  bloc.inSearch.add(null);
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent),
                    ),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: snapshot.data.length + 1,
            );
          } else {
            return Container(
              child: Center(
                child: Icon(
                  Icons.anchor_outlined,
                  color: Colors.redAccent,
                  size: 40,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
