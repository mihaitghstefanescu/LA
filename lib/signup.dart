import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
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
                  fontWeight: FontWeight.bold,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Image.asset(
                    'images/girl.png',
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    'images/teamwork.png',
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                  new Image.asset(
                    'images/man.png',
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
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
                    Navigator.pushNamed(context, '/CREATE_CHARACTER');
                  },
                  child: const Text('UPLOAD IMAGE',
                      style: TextStyle(fontSize: 16)),
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
}

class CharacterCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload image here"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
