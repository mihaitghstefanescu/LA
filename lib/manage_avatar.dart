import 'package:flutter/material.dart';

class ManageAvatar extends StatelessWidget {
  const ManageAvatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: 180,
            child: Image.asset('images/Jane.PNG'),
          ),
          Container(
            width: 160,
            child: Image.asset('images/IQRCode.png'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(
              'Jane',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Text(
              'SAN FRANCISCO, CA',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      child: Material(
                        color: Colors.white,
                        child: Center(
                          child: Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.indigo,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'edit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      child: Material(
                        color: Colors.white,
                        child: Center(
                          child: Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.indigo,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.share),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'share',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      child: Material(
                        color: Colors.white,
                        child: Center(
                          child: Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.indigo,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.settings),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'settings',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 360,
            height: 50,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'MANAGE KEY RINGS',
                style: TextStyle(
                  color: Colors.indigo,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              textColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.indigo, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 360,
            height: 50,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'MANAGE BADGES',
                style: TextStyle(
                  color: Colors.indigo,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              textColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.indigo, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ],
      ),
    );
  }
}
