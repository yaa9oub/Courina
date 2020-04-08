import 'package:flutter/material.dart';
import 'package:conapp/splashScreen.dart';

import 'splashScreen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink[50],
      ),
      debugShowCheckedModeBanner: false,
      home : MySplashScreen(),
    );
  }
}

