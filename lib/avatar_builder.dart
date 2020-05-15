import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarBuilderScreen extends StatelessWidget {
  final String type;

  const AvatarBuilderScreen({
    Key key,
    @required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int tabsNumber = AvatarModel.AVATAR_PROPERTIES[this.type].keys.length;
    return DefaultTabController(
      child: new Scaffold(
          backgroundColor: Colors.grey[50],
          body: SafeArea(child: AvatarPropertiesWidget(type: type))),
      length: tabsNumber,
    );
  }
}

class AvatarPropertiesWidget extends StatefulWidget {
  final String type;

  const AvatarPropertiesWidget({
    Key key,
    @required this.type,
  }) : super(key: key);

  @override
  _AvatarPropertiesState createState() => _AvatarPropertiesState();
}

class _AvatarPropertiesState extends State<AvatarPropertiesWidget> {
  String _avatarGender = 'female';
  Map<String, String> _avatarProperties = {
    'skin': 'alien',
    'hair': '',
    'eyebrows': '-1',
    'eyes': '-1-1',
    'nose': '-1',
    'mouth': '-1',
    'chin': '',
    'beard': '',
    'glasses': '',
    'accessories': '',
  };

  @override
  Widget build(BuildContext context) {
    _avatarGender = widget.type;
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: new EdgeInsets.fromLTRB(15, 20, 0, 0),
            child: Text(
              'Create Avatar',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 26,
                color: Colors.indigo,
              ),
            ),
          ),
          new Container(
              decoration: new BoxDecoration(color: Colors.transparent),
              child: new Column(
                children: <Widget>[
                  new Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: new BoxDecoration(color: Colors.transparent),
                      child: _getStackedProperties(_avatarProperties))
                ],
              )),
          Expanded(
              child: new Container(
                  alignment: Alignment.bottomCenter,
                  margin: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: new BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.grey[350],
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                            offset: Offset(0, 0))
                      ]),
                  child: new Column(children: <Widget>[
                    new Container(
                        decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.grey[350],
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                                offset: Offset(0, 0))
                          ],
                        ),
                        child: _getPropertiesTabBar()),
                    new Expanded(
                      child: _getPropertiesTabBarView(),
                    ),
                  ])))
        ]);
  }

  Widget _getPropertiesTabBar() {
    List<Widget> tabButtons = new List<Widget>();
    Map<String, dynamic> propertiesMap =
        AvatarModel.AVATAR_PROPERTIES[_avatarGender];
    var properties = propertiesMap.keys;
    for (var property in properties) {
      tabButtons.add(new Tab(text: propertiesMap[property]['label']));
    }

    return TabBar(
        isScrollable: true,
        unselectedLabelColor: Colors.indigo.withOpacity(0.3),
        indicatorColor: Colors.indigo,
        labelColor: Colors.indigo,
        tabs: tabButtons);
  }

  Widget _getPropertiesTabBarView() {
    List<Widget> tabViews = new List<Widget>();
    Map<String, dynamic> propertiesMap =
        AvatarModel.AVATAR_PROPERTIES[_avatarGender];
    var properties = propertiesMap.keys;
    for (var activeProperty in properties) {
      List<Widget> list = new List<Widget>();
      List<String> propertyOptions = [];
      bool isSkinProperty = activeProperty == 'skin' ? true : false;
      Map<String, dynamic> propertyObject =
          AvatarModel.AVATAR_PROPERTIES[_avatarGender][activeProperty];
      Map<String, String> avatarProperties =
          new Map<String, String>.from(_avatarProperties);

      if (isSkinProperty == true) {
        propertyOptions = AvatarModel.AVATAR_SKINS[_avatarGender];
      } else {
        bool skinVariant = propertyObject['skinVariant'];
        bool removable = propertyObject['removable'];
        int variationsCount = propertyObject['variationsCount'];
        List subVariations = propertyObject['subVariations'];
        if (skinVariant == true) {
          for (var i = 0; i < variationsCount; i++) {
            propertyOptions.add('-' + (i + 1).toString());
          }
        } else {
          for (var i = 0; i < variationsCount; i++) {
            for (var j = 0; j < subVariations[i]; j++) {
              propertyOptions
                  .add(('-' + (i + 1).toString() + '-' + (j + 1).toString()));
            }
          }
        }
        if (removable == true) {
          propertyOptions.add('');
        }
      }

      for (var i = 0; i < propertyOptions.length; i++) {
        var property = propertyOptions[i];
        bool isActive =
            property == _avatarProperties[activeProperty] ? true : false;

        avatarProperties[activeProperty] = property;

        list.add(new GestureDetector(
          child: new Container(
            padding: isActive ? null : const EdgeInsets.all(2.0),
            child: _getStackedProperties(avatarProperties),
            decoration: new BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: isActive
                  ? Border.all(
                      color: Colors.indigo, width: 2, style: BorderStyle.solid)
                  : null,
              boxShadow: [
                new BoxShadow(
                    color: Colors.grey[350],
                    blurRadius: 8.0,
                    spreadRadius: 3.0,
                    offset: Offset(0, 3))
              ],
            ),
          ),
          onTap: () {
            _setPropertyOption(activeProperty, property);
          },
        ));
      }

      tabViews.add(GridView.count(
        primary: false,
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 6 / 7,
        children: list,
      ));
    }
    return TabBarView(children: tabViews);
  }

  Widget _getStackedProperties(avatarProperties) {
    List<Widget> list = new List<Widget>();
    Map<String, dynamic> propertiesMap =
        AvatarModel.AVATAR_PROPERTIES[_avatarGender];
    var basePath = AvatarModel.AVATAR_ASSETS_BASE_PATH + '/' + _avatarGender;
    var propertiesKeys = propertiesMap.keys;
    var imgPath = '';
    var imgExtension = '.png';

    for (var propertyKey in propertiesKeys) {
      if (avatarProperties[propertyKey] != '') {
        imgPath = basePath + '/';
        if (propertyKey == 'skin') {
          imgPath += avatarProperties[propertyKey] + '/skin' + imgExtension;
        } else {
          Map<String, dynamic> propertyObject = propertiesMap[propertyKey];
          var propertyOption = avatarProperties[propertyKey];
          var skinVariant = propertyObject['skinVariant'];
          imgPath += (skinVariant ? avatarProperties['skin'] : 'common') + '/';
          imgPath += propertyKey + propertyOption + imgExtension;
        }

        list.add(new Container(
          padding: const EdgeInsets.all(0),
          child: new Row(
            children: <Widget>[
              Expanded(
                child: new Image.asset(imgPath, fit: BoxFit.cover),
              )
            ],
          ),
          decoration: new BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ));
      }
    }

    return Stack(
      children: list,
    );
  }

  void _setPropertyOption(property, option) {
    setState(() {
      _avatarProperties[property] = option;
    });
  }
}

class AvatarModel {
  static const String AVATAR_ASSETS_BASE_PATH = 'images/avatar';

  static const List<String> AVATAR_GENDERS = ['male', 'female', 'alien'];

  static const Map<String, dynamic> AVATAR_SKINS = {
    'male': ['vampire', 'robot', 'alien', 'zombie'],
    'female': ['vampire', 'afro', 'robot', 'alien', 'zombie']
  };

  static const Map<String, dynamic> AVATAR_POSITION = {
    'male': {'scale': 3.0, 'alignX': 0.9, 'alignY': 0.0},
    'female': {'scale': 3.0, 'alignX': 0.0, 'alignY': 0.0}
  };

  static const Map<String, dynamic> AVATAR_PROPERTIES = {
    'male': {
      'skin': {'label': 'Skin', 'scale': 7.0, 'alignX': 2.5, 'alignY': 0.3},
      'hair': {
        'label': 'Hairstyle',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 10,
        'subVariations': [6, 6, 7, 6, 6, 6, 6, 6, 6, 6],
        'scale': 7.0,
        'alignX': 2.5,
        'alignY': -0.6
      },
      'eyebrows': {
        'label': 'Brows',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [],
        'scale': 5.0,
        'alignX': 0.25,
        'alignY': 0.3
      },
      'eyes': {
        'label': 'Eyes',
        'skinVariant': false,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [6, 1, 6, 6, 6, 1, 1, 6, 6, 6],
        'scale': 4.2,
        'alignX': 0.2,
        'alignY': 0.3
      },
      'nose': {
        'label': 'Nose',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [],
        'scale': 4.0,
        'alignX': 0.2,
        'alignY': 0.5
      },
      'chin': {
        'label': 'Chin',
        'skinVariant': true,
        'removable': true,
        'variationsCount': 10,
        'subVariations': [],
        'scale': 5.0,
        'alignX': 0.2,
        'alignY': 1.3
      },
      'mouth': {
        'label': 'Mouth',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 11,
        'subVariations': [],
        'scale': 4.3,
        'alignX': 0.2,
        'alignY': 0.8
      },
      'beard': {
        'label': 'Facial Hair',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 10,
        'subVariations': [2, 1, 1, 1, 2, 2, 1, 1, 1, 1],
        'scale': 5.0,
        'alignX': 0.2,
        'alignY': 0.9
      },
      'glasses': {
        'label': 'Eyewear',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 4,
        'subVariations': [6, 6, 6, 6],
        'scale': 5.0,
        'alignX': 0.2,
        'alignY': 0.3
      },
    },
    'female': {
      'skin': {'label': 'Skin', 'scale': 6.9, 'alignX': 0.0, 'alignY': 0.1},
      'hair': {
        'label': 'Hairstyle',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 1,
        'subVariations': [60],
        'scale': 6.9,
        'alignX': 0.0,
        'alignY': 0.1
      },
      'eyebrows': {
        'label': 'Brows',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 17,
        'subVariations': [],
        'scale': 5.0,
        'alignX': 0.25,
        'alignY': 0.3
      },
      'eyes': {
        'label': 'Eyes',
        'skinVariant': false,
        'removable': false,
        'variationsCount': 1,
        'subVariations': [56],
        'scale': 4.2,
        'alignX': 0.2,
        'alignY': 0.3
      },
      'nose': {
        'label': 'Nose',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 15,
        'subVariations': [],
        'scale': 4.0,
        'alignX': 0.2,
        'alignY': 0.5
      },
      'chin': {
        'label': 'Chin',
        'skinVariant': true,
        'removable': true,
        'variationsCount': 9,
        'subVariations': [],
        'scale': 5.0,
        'alignX': 0.2,
        'alignY': 1.3
      },
      'mouth': {
        'label': 'Mouth',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [],
        'scale': 4.3,
        'alignX': 0.0,
        'alignY': 0.6
      },
      'accessories': {
        'label': 'Accessories',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 1,
        'subVariations': [21],
        'scale': 2.0,
        'alignX': 0.8,
        'alignY': 0.3
      },
      'glasses': {
        'label': 'Glasses',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 1,
        'subVariations': [15],
        'scale': 5.0,
        'alignX': 0.2,
        'alignY': 0.3
      },
    }
  };
}
