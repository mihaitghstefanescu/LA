import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          constraints: BoxConstraints.expand(),
          child: new Buttons()),
    );
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 180,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/LOG_IN');
              },
              child: const Text('LOG IN', style: TextStyle(fontSize: 16)),
              color: Colors.white70.withOpacity(1),
              textColor: Colors.indigo,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 180,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/CREATE_AVATAR');
              },
              child:
                  const Text('CREATE AVATAR', style: TextStyle(fontSize: 16)),
              color: Colors.indigo,
              textColor: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
