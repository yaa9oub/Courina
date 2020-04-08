import 'package:conapp/home.dart';
import 'package:flutter/material.dart';
import 'package:conapp/news.dart';
import 'package:conapp/textField.dart';

class MySignUpPage extends StatefulWidget {
  @override
  _MySignUpPageState createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  Color bgColor = Colors.blue[100] ; 
  bool _signup = false;
  String btn1 = "LOGIN", btn2 = "Sign-Up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: bgColor,
        duration: Duration(seconds: 1),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 4 / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    child: Image.asset(
                      "images/virus.png",
                      width: 100,
                      height: 100,
                    ),
                    tag: "icon",
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MyTextField("PHONE NUMBER"),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextField("PASSWORD"),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: _signup,
                          child: MyTextField("CONFIRM PASSWORD")),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    child: _ButtonBuilder(btn1),
                    onTap: () {
                      if (btn1 == "Sign-Up") {
                        setState(() {
                          _signup = false;
                        btn1 = "LOGIN";
                        btn2 = "Sign-Up";
                        bgColor = Colors.blue[100];
                        });
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()) );
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (btn2 != "Cancel") {
                            _signup = true;
                            btn1 = "Sign-Up";
                            btn2 = "Cancel";
                            bgColor = Colors.blue[400];
                          } else {
                            _signup = false;
                            btn1 = "LOGIN";
                            btn2 = "Sign-Up";
                            bgColor = Colors.blue[100];
                          }
                        });
                      },
                      child: Text(
                        btn2,
                        style: TextStyle(color: Colors.pink),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ButtonBuilder(String text) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFFFB415B),
            Color(0xFFEE5623),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
