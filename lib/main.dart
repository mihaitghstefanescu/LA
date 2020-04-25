import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'menu.dart';
import 'signup.dart';

void main() => runApp(LiquidAvatar());

class LiquidAvatar extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liquid Avatar',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/LOG_IN': (context) => LoginScreen(),
        '/CREATE_AVATAR': (context) => SignUpScreen(),
        '/LOG_IN/MAIN_MENU': (context) => MainMenu(),
      },
    );
  }
}
