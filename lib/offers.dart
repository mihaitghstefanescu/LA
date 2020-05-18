import 'package:flutter/material.dart';

class Place {
  String imageUrl;
  String name;
  String country;

  Place({this.imageUrl, this.name, this.country});
}

class Fashion {
  String imgSrc;
  String name;

  Fashion({this.imgSrc, this.name});
}

class OffersPage extends StatelessWidget {
  const OffersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List wonders = [
      Place(
          imageUrl:
              "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
          name: "Taj Mahal",
          country: "India"),
      Place(
          imageUrl:
              "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Christ-the-Redeemer.jpg",
          name: "Christ the Redeemer",
          country: "Brazil"),
      Place(
          imageUrl:
              "https://d36tnp772eyphs.cloudfront.net/blogs/1/2016/03/petra-jordan9.jpg",
          name: "Petra",
          country: "Jordan"),
      Place(
          imageUrl:
              "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Great-Wall-of-China-view.jpg",
          name: "The Great Wall of China",
          country: "China"),
      Place(
          imageUrl:
              "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/View-of-the-Colosseum.jpg",
          name: "The Colosseum",
          country: "Rome"),
      Place(
          imageUrl:
              "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Machu-Picchu-around-sunset.jpg",
          name: "Machu Picchu",
          country: "Peru"),
      Place(
          imageUrl:
              "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Chichen-Itza-at-night.jpg",
          name: "Chichén Itzá",
          country: "Mexico"),
    ];

    List fashionList = [
      Fashion(
        imgSrc: "images/fashion-1.jpg",
        name: "Summer 1",
      ),
      Fashion(
        imgSrc: "images/fashion-2.jpg",
        name: "Summer 2",
      ),
      Fashion(
        imgSrc: "images/fashion-3.jpg",
        name: "Summer 3",
      ),
      Fashion(
        imgSrc: "images/fashion-4.jpg",
        name: "Summer 4",
      ),
    ];

    final titles = [
      'bike',
      'boat',
      'bus',
      'car',
      'railway',
      'run',
      'subway',
      'transit',
      'walk'
    ];

    final icons = [
      Icons.directions_bike,
      Icons.directions_boat,
      Icons.directions_bus,
      Icons.directions_car,
      Icons.directions_railway,
      Icons.directions_run,
      Icons.directions_subway,
      Icons.directions_transit,
      Icons.directions_walk
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 15),
            child: Center(
              child: Text(
                'Offers / KABN Kash',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: Colors.indigo,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              'NEW FASHION OFFERS FOR YOU',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: wonders.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        wonders[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(wonders[index].name),
                    Text(wonders[index].country),
                  ],
                ));
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
            child: Text(
              'NEW TRAVEL OFFERS FOR YOU',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fashionList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          fashionList[index].imgSrc,
                          width: 350,
                          height: 120,
                        ),
                      ),
                      Text(fashionList[index].name),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
            child: Text(
              'BROWSE ALL RETAIL OFFERS',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(icons[index]),
                    title: Text(titles[index]),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
