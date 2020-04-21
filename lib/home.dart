import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            RaisedButton(
              child: Text('Launch screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            SizedBox(width: 20),
            RaisedButton(
              child: Text('Launch screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
