import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarBuilderScreen extends StatelessWidget {
  const AvatarBuilderScreen({Key key}) : super(key: key);

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
              Container(
                  margin: new EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SizedBox(height: 250)),
              Expanded(
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: new EdgeInsets.fromLTRB(0, 20, 0, 0),
                      padding: new EdgeInsets.fromLTRB(20, 0, 20, 0),
                      decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: new BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.grey[350],
                                blurRadius: 20.0,
                                spreadRadius: 15.0,
                                offset: Offset(0, 0))
                          ]),
                      child: Column(children: <Widget>[
                        Container(
                          padding: new EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(children: <Widget>[
                            Expanded(
                              child: new Image.asset(
                                'images/icons/face-man.png',
                                height: 30.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Expanded(
                              child: new Image.asset(
                                'images/icons/nose.png',
                                height: 25.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Expanded(
                              child: new Image.asset(
                                'images/icons/ear.png',
                                height: 25.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Expanded(
                              child: new Image.asset(
                                'images/icons/mouth.png',
                                height: 30.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Expanded(
                              child: new Image.asset(
                                'images/icons/eye.png',
                                height: 30.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Expanded(
                              child: new Image.asset(
                                'images/icons/beard.png',
                                height: 28.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Expanded(
                              child: new Image.asset(
                                'images/icons/human-body.png',
                                height: 28.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 200,
                          child: Container(),
                        ),
                      ])))
            ])));
  }
}
