import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  String text;
  MyButton(txt) {
    text = txt;
  }
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  Color fstCol = Colors.red;
  Color sndCol = Colors.pink[50];
  LinearGradient bgColor;

  @override
  void initState() {
    super.initState();
    bgColor = LinearGradient(
        colors: [fstCol, sndCol],
        begin: Alignment.centerLeft,
        end: Alignment.bottomRight);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
