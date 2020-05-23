import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AvatarService {
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

  static String imageURL = '';

  static Future saveAvatar() async {
    final http.Response response = await http.post(
      'http://167.172.214.198',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "avatar": {
          "skin": "images/avatar/male/alien/skin.png",
          "hair": "images/avatar/male/common/hair-1-1.png",
          "eyebrows": "images/avatar/male/alien/eyebrows-1.png",
          "eyes": "images/avatar/male/common/eyes-1-1.png",
          "nose": "images/avatar/male/alien/nose-1.png",
          "mouth": "images/avatar/male/alien/mouth-1.png",
          "chin": "images/avatar/male/alien/chin-1.png",
          "beard": "images/avatar/male/common/beard-1-1.png",
          "glasses": "images/avatar/male/common/glasses-1-1.png"
        },
        "_id": "5d4e2641f4f4ed7dd9fb8674875f236b8fcc4394"
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return debugPrint(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load avatar');
    }
  }
}
