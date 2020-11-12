import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/data/remote/character_api.dart';
import 'package:rickandmorty/data/remote/episodes_api.dart';
import 'package:rickandmorty/data/remote/location_api.dart';
import 'package:rickandmorty/presentacion/widgets/characters_card.dart';
import 'package:rickandmorty/presentacion/widgets/episodes_card.dart';
import 'package:rickandmorty/presentacion/widgets/locations_card.dart';

class Home extends StatefulWidget {
  // Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading;
  var charactersList;
  var locationsList;
  var episodesList;

  void getCharacter() async {
    CharacterApi characters = CharacterApi();
    await characters.getCharacters();
    charactersList = characters.characters;
    setState(() {
      _loading = false;
    });
  }

  void getLocations() async {
    LocationApi locations = LocationApi();
    await locations.getLocations();
    locationsList = locations.locations;
    setState(() {
      _loading = false;
    });
  }

  void getEpisodes() async {
    EpisodesApi episodes = EpisodesApi();
    await episodes.getEpisodes();
    episodesList = episodes.episodes;
    print(episodesList[0].episodioD);
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getCharacter();
    getLocations();
    getEpisodes();
    _loading = false;
  }

  final titlePers = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(6),
        child: Text(
          "Personajes",
          style: TextStyle(
            fontFamily: "Lato",
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ],
  );

  final titleLoc = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(6),
        child: Text(
          "Planetas",
          style: TextStyle(
            fontFamily: "Lato",
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ],
  );
  final titleEpisodio = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(6),
        child: Text(
          "Episodios",
          style: TextStyle(
            fontFamily: "Lato",
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    String pathImage = "assets/images/icono.jpg";
    final contenido = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Rick and Morty',
          style: TextStyle(
            fontFamily: "Lato",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
          child: Image.asset(
            pathImage,
            height: 50,
            width: 50,
            // add custom icons also
          ),
        ),
      ),
      body: (_loading = false)
          ? Center(child: CupertinoActivityIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    titlePers,
                    Container(
                      height: 250,
                      padding: EdgeInsets.only(right: 15),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: charactersList?.length ?? 0,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CharactersCard(
                            urlImage: charactersList[index].urlImage ?? "",
                            name: charactersList[index].name ?? "",
                            species: charactersList[index].species ?? "",
                            gender: charactersList[index].gender ?? "",
                            status: charactersList[index].status ?? "",
                          );
                        },
                      ),
                    ),
                    titleLoc,
                    Container(
                      height: 100,
                      padding: EdgeInsets.only(right: 15),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: locationsList?.length ?? 0,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return LocationsCard(
                            name: locationsList[index].name ?? "",
                            dimension: locationsList[index].dimension ?? "",
                            type: locationsList[index].type ?? "",
                          );
                        },
                      ),
                    ),
                    titleEpisodio,
                    Container(
                      height: 100,
                      padding: EdgeInsets.only(right: 15),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: episodesList?.length ?? 0,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return EpisodesCard(
                            name: episodesList[index].name ?? "",
                            airDate: episodesList[index].airDate ?? "",
                            episodioD: episodesList[index].episodioD ?? "",
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
    return SafeArea(child: contenido);
  }
}
