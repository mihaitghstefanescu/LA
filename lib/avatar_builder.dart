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

  static const Map<String, dynamic> AVATAR_PROPERTIES = {
    'male': {
      'skin': {
        'prefix': 't-',
        'variations': ['-robot', '-vamp', '-zombie'],
      },
      'hair': {
        'prefix': 'b-',
        'variations': [
          '01-1',
          '01-2',
          '01-3',
          '01-4',
          '01-5',
          '01-6',
          '02-1',
          '02-2',
          '02-3',
          '02-4',
          '02-5',
          '02-6',
          '03-1',
          '03-2',
          '03-3',
          '03-4',
          '03-5',
          '03-6',
          '04-1',
          '04-2',
          '04-3',
          '04-4',
          '04-5',
          '04-6',
          '05-1',
          '05-2',
          '05-3',
          '05-4',
          '05-5',
          '05-6',
          '06-1',
          '06-2',
          '06-3',
          '06-4',
          '06-5',
          '06-6',
          '07-1',
          '07-2',
          '07-3',
          '07-4',
          '07-5',
          '07-6',
          '08-1',
          '08-2',
          '08-3',
          '08-4',
          '08-5',
          '08-6',
          '09-1',
          '09-2',
          '09-3',
          '09-4',
          '09-5',
          '09-6',
          '10-1',
          '10-2',
          '10-3',
          '10-4',
          '10-5',
          '10-6',
          ''
        ],
      },
      'eyebrows': {
        'prefix': 'q-',
        'variations': [
          '01-ali',
          '01-rob',
          '01-vamp',
          '01-Zomb',
          '02-ali',
          '02-rob',
          '02-vamp',
          '02-zomb',
          '03-ali',
          '03-rob',
          '03-vamp',
          '03-Zomb',
          '04-ali',
          '04-rob',
          '04-vamp',
          '04-zom',
          '05-ali',
          '05-rob',
          '05-vamp',
          '05-zomb',
          '06-ali',
          '06-rob',
          '06-vamp',
          '06-zomb',
          '07-ali',
          '07-rob',
          '07-vamp',
          '07-zom',
          '08-ali',
          '08-rob',
          '08-vamp',
          '08-zomb',
          '09-ali',
          '09-rob',
          '09-vamp',
          '09-zomb',
          '10-ali',
          '10-rob',
          '10-vamp',
          '10-zom',
        ],
      },
      'eyes': {
        'prefix': 'o-',
        'variations': [
          '01-1',
          '01-2',
          '01-3',
          '01-4',
          '01-5',
          '01-6',
          '02',
          '03-1',
          '03-2',
          '03-3',
          '03-4',
          '03-5',
          '03-6',
          '04-1',
          '04-2',
          '04-3',
          '04-4',
          '04-5',
          '04-6',
          '05-1',
          '05-2',
          '05-3',
          '05-4',
          '05-5',
          '05-6',
          '06-chinese',
          '07-owned',
          '08-1',
          '08-2',
          '08-3',
          '08-4',
          '08-5',
          '08-6',
          '09-1',
          '09-2',
          '09-3',
          '09-4',
          '09-5',
          '09-6',
          '10-1',
          '10-2',
          '10-3',
          '10-4',
          '10-5',
          '10-6',
        ],
      },
      'nose': {
        'prefix': 'p-',
        'variations': [
          '01-ali',
          '01-rob',
          '01-vamp',
          '01-zomb',
          '02-ali',
          '02-rob',
          '02-vamp',
          '02-zomb',
          '03-ali',
          '03-rob',
          '03-vamp',
          '03-zomb',
          '04-ali',
          '04-rob',
          '04-vamp',
          '04-zomb',
          '05-ali',
          '05-rob',
          '05-vamp',
          '05-zomb',
          '06-ali',
          '06-rob',
          '06-vamp',
          '06-zomb',
          '07-ali',
          '07-rob',
          '07-vamp',
          '07-zomb',
          '08-ali',
          '08-rob',
          '08-vamp',
          '08-zomb',
          '09-ali',
          '09-rob',
          '09-vamp',
          '09-zomb',
          '10-ali',
          '10-rob',
          '10-vamp',
          '10-zomb',
        ],
      },
      'chin': {
        'prefix': 'e-',
        'variations': [
          '01-ali.png',
          '01-rob.png',
          '01-vamp.png',
          '01-Zomb.png',
          '02-ali',
          '02-rob',
          '02-vamp',
          '02-zomb',
          '03-ali',
          '03-rob',
          '03-vamp',
          '03-zomb',
          '04-ali',
          '04-rob',
          '04-vamp',
          '04-zomb',
          '05-ali',
          '05-rob',
          '05-vamp',
          '05-Zomb',
          '06-ali',
          '06-rob',
          '06-vamp',
          '06-zomb',
          '07-ali',
          '07-rob',
          '07-vamp',
          '07-zomb',
          '08-ali',
          '08-rob',
          '08-vamp',
          '08-zomb',
          '09-ali',
          '09-Rob',
          '09-Vamp',
          '09-Zomb',
          '10-Ali',
          '10-Rob',
          '10-Vamp',
          '10-Zomb',
        ],
      },
      'mouth': {
        'prefix': 'c-',
        'variations': [
          '01-ali',
          '01-rob',
          '01-vamp',
          '01-zomb',
          '02-ali',
          '02-rob',
          '02-vamp',
          '02-zomb',
          '03-ali',
          '03-rob',
          '03-vamp',
          '03-zomb',
          '04-ali',
          '04-rob',
          '04-vamp',
          '04-zomb',
          '05-ali',
          '05-rob',
          '05-vamp',
          '05-zomb',
          '06-ali',
          '06-Rob',
          '06-vamp',
          '06-Zomb',
          '07-ali',
          '07-rob',
          '07-vamp',
          '07-zomb',
          '08-ali',
          '08-rob',
          '08-vamp',
          '08-zomb',
          '09-a',
          '09-nocigar',
          '09-r',
          '09-v',
          '09-z',
          '10-a',
          '10-r',
          '10-v',
          '10-z',
        ],
      },
      'beard': {
        'prefix': 'd-',
        'variations': [
          '02-chin',
          '03-thin',
          '05-goatee',
          '05-moustache',
          '06-1',
          '06-2',
          '07-1',
          '08-richi',
          '09-pointy',
          'd-beard01-1.png',
          'd-beard01-Moustache.png',
          'd-beard04-fat',
          'd-beard10-double',
          ''
        ],
      },
      'glasses': {
        'prefix': 'n-',
        'variations': [
          '01-1',
          '01-2',
          '01-3',
          '01-4',
          '01-5',
          '01-6',
          '02-1',
          '02-2',
          '02-3',
          '02-4',
          '02-5',
          '02-6',
          '04-1',
          '04-2',
          '04-3',
          '04-4',
          '04-5',
          '04-6',
          '05-1',
          '05-2',
          '05-3',
          '05-4',
          '05-5',
          '05',
          ''
        ],
      },
    }
  };
}
