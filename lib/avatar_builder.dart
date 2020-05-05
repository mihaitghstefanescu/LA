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
    return new Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(child: AvatarPropertiesWidget(type: type)));
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
  String _avatarGender = 'male';
  String _avatarSkin = 'alien';
  String _avatarActiveProperty = 'skin';
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
  };

  @override
  Widget build(BuildContext context) {
    _avatarGender = widget.type;
    return Column(
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
          Container(
              margin: new EdgeInsets.fromLTRB(0, 0, 0, 10),
              padding: new EdgeInsets.fromLTRB(0, 0, 25, 0),
              decoration: new BoxDecoration(color: Colors.transparent),
              child: SizedBox(
                  height: 300, child: Center(child: _getStackedProperties()))),
          Expanded(
              child: Container(
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
                  child: Column(children: <Widget>[
                    Container(
                        padding: new EdgeInsets.fromLTRB(12, 10, 12, 10),
                        child: SizedBox(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: _getPropertiesBar(),
                            ))),
                    Expanded(
                      child: _getPropertiesOptions(),
                    ),
                  ])))
        ]);
  }

  List<Widget> _getPropertiesBar() {
    List<Widget> list = new List<Widget>();
    Map<String, dynamic> propertiesMap =
        AvatarModel.AVATAR_PROPERTIES[_avatarGender];
    var properties = propertiesMap.keys;
    var imgPath = 'images/icons/avatar-' + _avatarGender + '-';
    var imgExtension = '.png';
    for (var property in properties) {
      list.add(new GestureDetector(
        child: new Image.asset(imgPath + property + imgExtension,
            fit: BoxFit.fitHeight),
        onTap: () {
          _setPropertyOptions(property);
        },
      ));
    }
    return list;
  }

  Widget _getPropertiesOptions() {
    List<Widget> list = new List<Widget>();
    var basePath = AvatarModel.AVATAR_ASSETS_BASE_PATH + '/' + _avatarGender;
    var removeIconPath = 'images/icons/remove.png';
    List<String> propertyOptions = [];
    var imgExtension = '.png';
    var imgPath = basePath + '/';
    double imgScale = 10.0;
    double alignX = 0.0;
    double alignY = 0.0;
    var isSkinProperty = _avatarActiveProperty == 'skin' ? true : false;

    if (isSkinProperty == true) {
      propertyOptions = AvatarModel.AVATAR_SKINS;
      imgScale = 7;
      alignX = 2.5;
      alignY = 0.3;
    } else {
      Map<String, dynamic> propertyObject =
          AvatarModel.AVATAR_PROPERTIES[_avatarGender][_avatarActiveProperty];
      bool skinVariant = propertyObject['skinVariant'];
      bool removable = propertyObject['removable'];
      int variationsCount = propertyObject['variationsCount'];
      List subVariations = propertyObject['subVariations'];
      imgScale = propertyObject['scale'];
      alignX = propertyObject['alignX'];
      alignY = propertyObject['alignY'];
      if (skinVariant == true) {
        imgPath += _avatarSkin + '/';
        for (var i = 0; i < variationsCount; i++) {
          propertyOptions.add('-' + (i + 1).toString());
        }
      } else {
        imgPath += 'common/';
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
      var p = propertyOptions[i];
      bool isActive =
          p == _avatarProperties[_avatarActiveProperty] ? true : false;
      var assetPath = '';

      if (isSkinProperty == true) {
        assetPath = imgPath + p + '/' + _avatarActiveProperty + imgExtension;
      } else {
        if (p != '') {
          assetPath = imgPath + _avatarActiveProperty + p + imgExtension;
        } else {
          assetPath = removeIconPath;
          imgScale = 10;
          alignX = 0;
          alignY = 0;
        }
      }

      list.add(new GestureDetector(
        child: new Container(
          padding: isActive ? null : const EdgeInsets.all(2.0),
          child: new Image.asset(
            assetPath,
            fit: BoxFit.none,
            scale: imgScale.toDouble(),
            alignment: Alignment(alignX, alignY),
          ),
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
          _setPropertyOption(_avatarActiveProperty, p);
        },
      ));
    }

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      childAspectRatio: 6 / 7,
      children: list,
    );
  }

  Widget _getStackedProperties() {
    List<Widget> list = new List<Widget>();
    Map<String, dynamic> propertiesMap =
        AvatarModel.AVATAR_PROPERTIES[_avatarGender];
    var basePath = AvatarModel.AVATAR_ASSETS_BASE_PATH + '/' + _avatarGender;
    var propertiesKeys = propertiesMap.keys;
    var imgPath = '';
    var imgExtension = '.png';

    for (var propertyKey in propertiesKeys) {
      imgPath = basePath + '/';
      if (propertyKey == 'skin') {
        imgPath += _avatarSkin + '/skin' + imgExtension;
      } else {
        Map<String, dynamic> propertyObject = propertiesMap[propertyKey];
        var propertyOption = _avatarProperties[propertyKey];
        var skinVariant = propertyObject['skinVariant'];
        imgPath += (skinVariant ? _avatarSkin : 'common') + '/';
        imgPath += propertyKey + propertyOption + imgExtension;
      }

      list.add(new Container(
        padding: const EdgeInsets.all(3),
        child: new Image.asset(imgPath, fit: BoxFit.cover),
        decoration: new BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ));
    }

    return Stack(
      children: list,
    );
  }

  void _setPropertyOptions(property) {
    setState(() {
      _avatarActiveProperty = property;
    });
  }

  void _setPropertyOption(property, option) {
    setState(() {
      _avatarProperties[property] = option;
      if (property == 'skin') {
        _avatarSkin = option;
      }
    });
  }
}

class AvatarModel {
  static const String AVATAR_ASSETS_BASE_PATH = 'images/avatar';

  static const List<String> AVATAR_GENDERS = ['male', 'female', 'alien'];

  static const List<String> AVATAR_SKINS = [
    'alien',
    'robot',
    'vampire',
    'zombie'
  ];

  static const Map<String, dynamic> AVATAR_PROPERTIES = {
    'male': {
      'skin': '',
      'hair': {
        'skinVariant': false,
        'removable': true,
        'variationsCount': 10,
        'subVariations': [6, 6, 7, 6, 6, 6, 6, 6, 6, 6],
        'scale': 7.0,
        'alignX': 2.5,
        'alignY': -0.6
      },
      'eyebrows': {
        'skinVariant': true,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [],
        'scale': 5.0,
        'alignX': 0.25,
        'alignY': 0.3
      },
      'eyes': {
        'skinVariant': false,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [6, 1, 6, 6, 6, 1, 1, 6, 6, 6],
        'scale': 4.2,
        'alignX': 0.2,
        'alignY': 0.3
      },
      'nose': {
        'skinVariant': true,
        'removable': false,
        'variationsCount': 10,
        'subVariations': [],
        'scale': 4.0,
        'alignX': 0.2,
        'alignY': 0.5
      },
      'chin': {
        'skinVariant': true,
        'removable': true,
        'variationsCount': 10,
        'subVariations': [],
        'scale': 5.0,
        'alignX': 0.2,
        'alignY': 1.3
      },
      'mouth': {
        'skinVariant': true,
        'removable': false,
        'variationsCount': 11,
        'subVariations': [],
        'scale': 4.3,
        'alignX': 0.2,
        'alignY': 0.8
      },
      'beard': {
        'skinVariant': false,
        'removable': true,
        'variationsCount': 10,
        'subVariations': [2, 1, 1, 1, 2, 2, 1, 1, 1, 1],
        'scale': 5.0,
        'alignX': 0.2,
        'alignY': 0.9
      },
      'glasses': {
        'skinVariant': false,
        'removable': true,
        'variationsCount': 4,
        'subVariations': [6, 6, 6, 6],
        'scale': 5.0,
        'alignX': 0.2,
        'alignY': 0.3
      },
    }
  };
}
