import 'package:flutter/material.dart';

class CharactersCard extends StatelessWidget {
  // const CharactersCard({Key key}) : super(key: key);
  CharactersCard({
    @required this.name,
    @required this.urlImage,
    this.species,
    this.status,
    this.gender,
  });
  final String name, species, gender, urlImage, status;

  @override
  Widget build(BuildContext context) {
    final cardImage = Container(
      height: 200,
      width: 200,
      margin: EdgeInsets.only(
        top: 10,
        left: 20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(urlImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 7),
          ),
        ],
      ),
    );

    final data = Positioned(
      bottom: 0,
      left: 10.0,
      right: 10.0,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                name + " - " + gender,
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
                species + " - " + status,
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
    return Stack(
      // alignment: Alignment(-0, -0.4),
      children: [cardImage, data],
    );
  }
}
