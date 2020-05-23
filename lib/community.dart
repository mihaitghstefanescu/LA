import 'package:flutter/material.dart';

class Choice {
  final String title;
  final String date;
  final String description;
  final String imglink;

  const Choice({this.title, this.date, this.description, this.imglink});
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final Choice choice;

  final VoidCallback onTap;

  final Choice item;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Expanded(
                  flex: 1,
                  child: Image.asset(choice.imglink),
                ),
                SizedBox(
                  width: 10,
                ),
                new Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(choice.title,
                          style: Theme.of(context).textTheme.title),
                      Text(choice.description),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key key}) : super(key: key);

  final List choices = const [
    const Choice(
        title: 'Ben Jackson',
        description: 'Shared personal data with you.',
        imglink: 'images/meditation.png'),
    const Choice(
        title: 'Sydney Alice',
        date: '1 June 2016',
        description: 'You shared your public profile.',
        imglink: 'images/target.png'),
    const Choice(
        title: 'Mike',
        date: '1 June 2019',
        description: 'Shared personal data with you.',
        imglink: 'images/video-conference.png'),
    const Choice(
        title: 'Rob',
        date: '1 June 2017',
        description: 'You shared your public profile.',
        imglink: 'images/target.png'),
    const Choice(
        title: 'Mihai',
        date: '1 June 2018',
        description: 'You shared your public profile.',
        imglink: 'images/target.png'),
    const Choice(
        title: 'RJ',
        date: '1 June 2018',
        description: 'You shared your public profile.',
        imglink: 'images/target.png'),
    const Choice(
        title: 'James',
        date: '1 June 2018',
        description: 'You shared your public profile.',
        imglink: 'images/target.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Community",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Text(
              'Explore Community Partners',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: List.generate(
                choices.length,
                (index) {
                  return Center(
                    child: ChoiceCard(
                        choice: choices[index], item: choices[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
