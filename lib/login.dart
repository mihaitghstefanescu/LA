import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final emailField = TextField(
    obscureText: false,
    style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
  );
  final passwordField = TextField(
    obscureText: true,
    style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: new EdgeInsets.fromLTRB(15, 20, 0, 0),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 40,
                    color: Colors.indigo,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  'Powered by:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: new Image.asset(
                  'images/KABN-med.png',
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              emailField,
              SizedBox(height: 25.0),
              passwordField,
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 350,
                  height: 60,
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/CAMERA');
                    },
                    child: const Text('LOG IN WITH KABN',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
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
      ),
    );
  }
}
