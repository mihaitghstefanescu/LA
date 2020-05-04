import 'package:flutter/material.dart';

class PegasusPage extends StatelessWidget {
  const PegasusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                margin: new EdgeInsets.fromLTRB(15, 20, 0, 0),
                child: Text(
                  'Pegasus Flyte Card',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 40,
                    color: Colors.indigo,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  'Sign Up to the waitlist for the Pegasus',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Text(
                  'Flyte Visa card !',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: new Image.asset(
                  'images/Pegasus-Flyte-card.png',
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Text(
                  'The Pegasus Flyte prepaid card provides cardholders with '
                  'access to unique value-based services and programs like KABN'
                  ' KASH, a program where users can earn cash back on '
                  'transactions at participating merchants and have access to '
                  'personalized offers.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 350,
                  height: 60,
                  child: new RaisedButton(
                    onPressed: () {},
                    child: const Text('SIGN ME UP FOR THE CARD !',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
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
