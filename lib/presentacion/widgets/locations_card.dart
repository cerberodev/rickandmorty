import 'package:flutter/material.dart';

class LocationsCard extends StatelessWidget {
  // const CharactersCard({Key key}) : super(key: key);
  LocationsCard({
    @required this.name,
    this.type,
    this.dimension,
  });
  final String name, type, dimension;

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
                name + " - " + type,
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
                dimension,
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
