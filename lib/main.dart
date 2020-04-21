import 'package:flutter/material.dart';
import 'package:flutterapp/login.dart';
import 'package:flutterapp/home.dart';
import 'package:flutterapp/signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Liquid Avatar',
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/login': (context) => LoginScreen(),
      '/signup': (context) => SignUpScreen(),
    },
  ));
}
