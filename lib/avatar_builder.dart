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
  double _avatarShrink = 0.9;
  Map<String, String> _avatarProperties = {
    'skin': 'vampire',
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
                fontSize: 24,
                color: Colors.indigo,
              ),
            ),
          ),
          Container(
              decoration: new BoxDecoration(color: Colors.transparent),
              child: new Column(
                children: <Widget>[
                  new Container(
                      height: MediaQuery.of(context).size.height *
                          0.4 *
                          _avatarShrink,
                      width: MediaQuery.of(context).size.width *
                          0.7 *
                          _avatarShrink,
                      decoration: new BoxDecoration(color: Colors.transparent),
                      child: _getStackedProperties(_avatarProperties))
                ],
              )),
          Expanded(
              child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  child: new Column(children: <Widget>[
                    new Container(
                        decoration: new BoxDecoration(
                          color: Colors.grey[100],
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.grey[350],
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                                offset: Offset(0.0, 8.0))
                          ],
                        ),
                        child: _getPropertiesTabBar()),
                    new Expanded(
                      child: GestureDetector(child: _getPropertiesTabBarView()),
                    ),
                  ]))),
          SizedBox(
            height: 90,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  height: 90,
                  decoration: new BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.grey[350],
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, -8.0))
                    ],
                  ),
                  child: new RaisedButton(
                    onPressed: () {},
                    child: const Text('SAVE AVATAR',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                    color: Colors.indigo,
                    textColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ))
              ],
            ),
          )
        ]);
  }

  Widget _getPropertiesTabBar() {
    List<Widget> tabButtons = new List<Widget>();
    Map<String, dynamic> propertiesMap =
        AvatarModel.AVATAR_PROPERTIES[_avatarGender];
    var properties = AvatarModel.AVATAR_PROPERTIES_ORDER[_avatarGender];
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
    var properties = AvatarModel.AVATAR_PROPERTIES_ORDER[_avatarGender];
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

        list.add(GestureDetector(
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

  static const Map<String, dynamic> AVATAR_PROPERTIES_ORDER = {
    'male': [
      'skin',
      'hair',
      'eyebrows',
      'eyes',
      'nose',
      'chin',
      'mouth',
      'beard',
      'glasses'
    ],
    'female': [
      'skin',
      'hair',
      'eyebrows',
      'eyes',
      'nose',
      'chin',
      'mouth',
      'glasses',
      'accessories'
    ],
  };

  static const Map<String, dynamic> AVATAR_PROPERTIES = {
    'male': {
      'skin': {'label': 'Skin'},
      'eyebrows': {
        'label': 'Brows',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [],
      },
      'eyes': {
        'label': 'Eyes',
        'skinVariant': false,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [6, 1, 6, 6, 6, 1, 1, 6, 6, 6],
      },
      'nose': {
        'label': 'Nose',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [],
      },
      'chin': {
        'label': 'Chin',
        'skinVariant': true,
        'removable': true,
        'variationsCount': 10,
        'subVariations': [],
      },
      'mouth': {
        'label': 'Mouth',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 11,
        'subVariations': [],
      },
      'beard': {
        'label': 'Facial Hair',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 10,
        'subVariations': [2, 1, 1, 1, 2, 2, 1, 1, 1, 1],
      },
      'glasses': {
        'label': 'Eyewear',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 4,
        'subVariations': [6, 6, 6, 6],
      },
      'hair': {
        'label': 'Hairstyle',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 10,
        'subVariations': [6, 6, 7, 6, 6, 6, 6, 6, 6, 6],
      },
    },
    'female': {
      'skin': {'label': 'Skin'},
      'eyebrows': {
        'label': 'Brows',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 17,
        'subVariations': [],
      },
      'eyes': {
        'label': 'Eyes',
        'skinVariant': false,
        'removable': false,
        'variationsCount': 1,
        'subVariations': [56],
      },
      'nose': {
        'label': 'Nose',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 15,
        'subVariations': [],
      },
      'chin': {
        'label': 'Chin',
        'skinVariant': true,
        'removable': true,
        'variationsCount': 9,
        'subVariations': [],
      },
      'mouth': {
        'label': 'Mouth',
        'skinVariant': true,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [],
      },
      'glasses': {
        'label': 'Glasses',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 1,
        'subVariations': [15],
      },
      'hair': {
        'label': 'Hairstyle',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 1,
        'subVariations': [60],
      },
      'accessories': {
        'label': 'Accessories',
        'skinVariant': false,
        'removable': true,
        'variationsCount': 1,
        'subVariations': [21],
      },
    }
  };
}
