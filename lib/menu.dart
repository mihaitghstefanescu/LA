import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'community.dart';
import 'manage_avatar.dart';
import 'offers.dart';
import 'pegasus.dart';
import 'read_avatar.dart';
import 'share_avatar.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({
    Key key,
  }) : super(key: key);

  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;

  void goToManageAvatar() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  void goToPegasus() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  void goToOffers() {
    setState(() {
      _selectedIndex = 3;
    });
  }

  void goToCommunity() {
    setState(() {
      _selectedIndex = 4;
    });
  }

  Widget body() {
    Widget _body;
    switch (_selectedIndex) {
      case 0:
        _body = MenuEntries(
          goToManageAvatar,
          goToPegasus,
          goToOffers,
          goToCommunity,
        );
        break;
      case 1:
        _body = ManageAvatar();
        break;
      case 2:
        _body = PegasusPage();
        break;
      case 3:
        _body = OffersPage();
        break;
      case 4:
        _body = CommunityPage();
        break;
    }

    return _body;
  }

  Widget _bottomNavigationBar(int selectedIndex) => FFNavigationBar(
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
            _selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: '',
            selectedBackgroundColor: Colors.blueAccent,
          ),
          FFNavigationBarItem(
            iconData: Icons.person_outline,
            label: '',
            selectedBackgroundColor: Colors.deepPurple[300],
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
            selectedBackgroundColor: Colors.orange,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: body(),
    );
  }
}

class MenuEntries extends StatelessWidget {
  MenuEntries(
    this.goToManageAvatar,
    this.goToPegasus,
    this.goToOffers,
    this.goToCommunity,
  );

  final Function goToManageAvatar;
  final Function goToPegasus;
  final Function goToOffers;
  final Function goToCommunity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Main menu',
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
                            goToManageAvatar();
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
                            goToCommunity();
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
                            goToPegasus();
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
                            goToOffers();
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReadAvatarPage(),
                              ),
                            );
                          },
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShareAvatarPage(),
                              ),
                            );
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
    );
  }
}
