import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_avatar/avatar_builder.dart';

import 'camera_module.dart';

class SignUpScreen extends StatelessWidget {
  final CameraDescription camera;

  const SignUpScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: new EdgeInsets.fromLTRB(15, 20, 0, 0),
              child: Text(
                'Create Avatar',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 40,
                  color: Colors.indigo,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Text(
                'Select your base character',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Expanded(
                      child: GestureDetector(
                          child: new Image.asset(
                            'images/icons/avatar-female.png',
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AvatarBuilderScreen(type: 'female'),
                              ),
                            );
                          })),
                  new Expanded(
                      child: GestureDetector(
                          child: new Image.asset(
                            'images/icons/avatar-male.png',
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AvatarBuilderScreen(type: 'male'),
                              ),
                            );
                          }))
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              child: Text(
                'OR',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 350,
                height: 60,
                child: new RaisedButton(
                  onPressed: () {
                    showUploadOptions(context);
                    //Navigator.pushNamed(context, '/LOG_IN');
                  },
                  child: const Text('UPLOAD IMAGE',
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                  color: Colors.indigo,
                  textColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showUploadOptions(BuildContext context) {
    // set up the buttons
    Widget selfieButton = FlatButton(
      child: Text("Take a selfie"),
      textColor: Colors.indigo,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TakePictureScreen(
              camera: this.camera,
            ),
          ),
        );
      },
    );
    Widget uploadFromDeviceButton = FlatButton(
      child: Text("Upload from device"),
      textColor: Colors.indigo,
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(
        child: Text("Choose upload method",
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
      ),
      actions: [
        selfieButton,
        uploadFromDeviceButton,
      ],
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(20.0),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
