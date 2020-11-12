import 'package:flutter/material.dart';

class EpisodesCard extends StatelessWidget {
  // const CharactersCard({Key key}) : super(key: key);
  EpisodesCard({
    @required this.name,
    this.episodioD,
    this.airDate,
  });
  final String name, episodioD, airDate;

  @override
  Widget build(BuildContext context) {
    final data = Container(
      child: Card(
        margin: EdgeInsets.only(
          bottom: 10,
          left: 20,
        ),
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                name,
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                episodioD + " - " + airDate,
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return GestureDetector(
      // alignment: Alignment(-0, -0.4),
      child: data,
    );
  }
}
