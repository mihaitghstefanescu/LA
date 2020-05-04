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
  String _avatarActiveProperty = 'skin';
  Map<String, String> _avatarProperties = {
    'skin': '-vamp',
    'hair': '',
    'eyebrows': '01-vamp',
    'eyes': '01-1',
    'nose': '02-vamp',
    'mouth': '04-vamp',
    'chin': '01-vamp.png',
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
    for (var property in properties) {
      list.add(new GestureDetector(
        child:
            new Image.asset(imgPath + property + '.png', fit: BoxFit.fitHeight),
        onTap: () {
          _setPropertyOptions(property);
        },
      ));
    }
    return list;
  }

  Widget _getPropertiesOptions() {
    List<Widget> list = new List<Widget>();
    Map<String, dynamic> property =
        AvatarModel.AVATAR_PROPERTIES[_avatarGender][_avatarActiveProperty];
    var propertiesOptions = property['variations'];
    var imgPrefix = property['prefix'];
    var imgExtension = 'png';
    var baseImgPath = AvatarModel.AVATAR_ASSETS_BASE_PATH +
        '/' +
        _avatarGender +
        '/' +
        imgPrefix +
        _avatarActiveProperty;

    for (var i = 0; i < propertiesOptions.length; i++) {
      var p = propertiesOptions[i];
      var imgPath = '';
      if (p != '') {
        imgPath = baseImgPath + p + '.' + imgExtension;
      } else {
        imgPath = 'images/icons/remove.png';
      }
      bool isActive = p == _avatarProperties[_avatarActiveProperty];
      list.add(new GestureDetector(
        child: new Container(
          padding: p != ''
              ? const EdgeInsets.fromLTRB(0, 0, 8, 3)
              : const EdgeInsets.all(40),
          child: new Image.asset(imgPath, fit: BoxFit.fitWidth),
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
    var propertiesKeys = propertiesMap.keys;
    for (var propertyKey in propertiesKeys) {
      var property = propertiesMap[propertyKey];
      var propertyOption = _avatarProperties[propertyKey];
      var imgPrefix = property['prefix'];
      var imgExtension = 'png';
      var imgPath = AvatarModel.AVATAR_ASSETS_BASE_PATH +
          '/' +
          _avatarGender +
          '/' +
          imgPrefix +
          propertyKey +
          propertyOption +
          '.' +
          imgExtension;
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
      'hair': {
        'skin_variant': false,
        'removable': true,
        'variations_count': 10,
        'sub_variations': [6, 6, 7, 6, 6, 6, 6, 6, 6, 6]
      },
      'eyebrows': {
        'skin_variant': true,
        'removable': false,
        'variations_count': 10,
        'sub_variations': []
      },
      'eyes': {
        'skin_variant': false,
        'removable': false,
        'variations_count': 10,
        'sub_variations': [6, 1, 6, 6, 6, 1, 1, 6, 6, 6]
      },
      'nose': {
        'skin_variant': true,
        'removable': false,
        'variations_count': 10,
        'sub_variations': []
      },
      'chin': {
        'skin_variant': true,
        'removable': true,
        'variations_count': 10,
        'sub_variations': []
      },
      'mouth': {
        'skin_variant': true,
        'removable': false,
        'variations_count': 11,
        'sub_variations': []
      },
      'beard': {
        'skin_variant': false,
        'removable': true,
        'variations_count': 10,
        'sub_variations': [2, 1, 1, 1, 2, 2, 1, 1, 1, 1]
      },
      'glasses': {
        'skin_variant': false,
        'removable': true,
        'variations_count': 4,
        'sub_variations': [6, 6, 6, 6]
      },
    }
  };
}
