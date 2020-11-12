import 'dart:convert';

import 'package:rickandmorty/domain/entities/character.dart';
import 'package:http/http.dart' as http;

class CharacterApi {
  List<Character> characters = [];

  Future<void> getCharacters() async {
    String url = "https://rickandmortyapi.com/api/character/";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    jsonData['results'].forEach((element) {
      if (element['name'] != null) {
        Character character = Character(
          name: element['name'],
          gender: element['gender'],
          species: element['species'],
          urlImage: element['image'],
          status: element['status'],
        );
        characters.add(character);
        // print(characters);
      }
    });
  }
}
