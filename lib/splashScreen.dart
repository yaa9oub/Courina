import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:conapp/signinup.dart';


class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreen(
        seconds: 5,
        image: Image.asset("images/virus.png"),
        loaderColor: Colors.white,
        photoSize: 100.0,
        gradientBackground: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 1],
          colors: [
            Colors.pink,
            Colors.lightBlue,
          ],
        ),
      navigateAfterSeconds: MySignUpPage(),
      ),
    
    );
  }
}
