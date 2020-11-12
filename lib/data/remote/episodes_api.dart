import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rickandmorty/domain/entities/episode.dart';

class EpisodesApi {
  List<Episode> episodes = [];

  Future<void> getEpisodes() async {
    String url = "https://rickandmortyapi.com/api/episode/";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    jsonData['results'].forEach((element) {
      if (element['name'] != null) {
        Episode episodio = Episode(
          name: element['name'],
          airDate: element['air_date'],
          episodioD: element['episode'],
        );
        episodes.add(episodio);
        // print(locations);
      }
    });
  }
}
