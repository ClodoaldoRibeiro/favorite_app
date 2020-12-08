import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models/video.dart';

const API_KEY = "AIzaSyDlmF1d-LT8HE1V0-6HSFcfkr7ujKdMQU0";

class Api {
  String _search;
  String _nextToken;

  /*
  *   Vai busar os vídeos do youtube
  * */
  Future<List<Video>> search(String search) async {
    http.Response response = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10");

    return decode(response);
  }

  /*
  * return  List<Video> retorna uma lista de vídeos atraves de um json
  * */
  List<Video> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      _nextToken = decoded["nextPageToken"];

      List<Video> videos = decoded["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      throw Exception("Falha ao carregar vídeos");
    }
  }
}