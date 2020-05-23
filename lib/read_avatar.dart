import 'dart:async';
import 'dart:io' show Platform;

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReadAvatarPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ReadAvatarPage> {
  ScanResult scanResult = null;

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = 0;
  var _useAutoFocus = true;
  var _autoEnableFlash = true;

  List<BarcodeFormat> selectedFormats = [BarcodeFormat.pdf417];

  @override
  // ignore: type_annotate_public_apis
  initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _numberOfCameras = await BarcodeScanner.numberOfCameras;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var contentList = <Widget>[
      if (scanResult != null)
        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Result Type"),
                subtitle: Text(scanResult.type?.toString() ?? ""),
              ),
              ListTile(
                title: Text("Raw Content"),
                subtitle: Text(scanResult.rawContent ?? ""),
              ),
              ListTile(
                title: Text("Format"),
                subtitle: Text(scanResult.format?.toString() ?? ""),
              ),
              ListTile(
                title: Text("Format note"),
                subtitle: Text(scanResult.formatNote ?? ""),
              ),
            ],
          ),
        ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  'Scan a barcode to read the avatar ...',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: scan,
                  iconSize: 100,
                ),
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: contentList,
            ),
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      var options = ScanOptions(
        restrictFormat: selectedFormats,
        useCamera: _selectedCamera,
        autoEnableFlash: _autoEnableFlash,
        android: AndroidOptions(
          aspectTolerance: _aspectTolerance,
          useAutoFocus: _useAutoFocus,
        ),
      );

      var result = await BarcodeScanner.scan(options: options);

      setState(() => scanResult = result);
    } on PlatformException catch (e) {
      var result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
      );

      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result.rawContent = 'The user did not grant the camera permission!';
        });
      } else {
        result.rawContent = 'Unknown error: $e';
      }
      setState(() {
        scanResult = result;
      });
    }
  }
}
