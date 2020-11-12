import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rickandmorty/domain/entities/location.dart';

class LocationApi {
  List<Location> locations = [];

  Future<void> getLocations() async {
    String url = "https://rickandmortyapi.com/api/location/";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    jsonData['results'].forEach((element) {
      if (element['name'] != null) {
        Location location = Location(
          name: element['name'],
          type: element['type'],
          dimension: element['dimension'],
        );
        locations.add(location);
        // print(locations);
      }
    });
  }
}
