import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({
    Key key,
  }) : super(key: key);

  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Hi Jane',
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 26,
            fontFamily: 'Montserrat',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Ink.image(
                        image: AssetImage('images/manage_avatar.PNG'),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Ink.image(
                        image: AssetImage('images/community.PNG'),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 4;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Ink.image(
                        image: AssetImage('images/pegasus.PNG'),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Ink.image(
                        image: AssetImage('images/view_offers.PNG'),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Ink.image(
                        image: AssetImage('images/read_avatar.PNG'),
                        child: InkWell(
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Ink.image(
                        image: AssetImage('images/share_avatar.PNG'),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          barHeight: 60,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: '',
            selectedBackgroundColor: Colors.deepPurple[300],
          ),
          FFNavigationBarItem(
            iconData: Icons.person_outline,
            label: '',
            selectedBackgroundColor: Colors.orange,
          ),
          FFNavigationBarItem(
            iconData: Icons.credit_card,
            label: '',
            selectedBackgroundColor: Colors.redAccent,
          ),
          FFNavigationBarItem(
            iconData: Icons.local_offer,
            label: '',
            selectedBackgroundColor: Colors.teal[200],
          ),
          FFNavigationBarItem(
            iconData: Icons.people,
            label: '',
            selectedBackgroundColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
