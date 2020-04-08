import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  String title , first , second ;

  RadioButton(t,f,s){
    title = t ; 
    first = f ;
    second = s;
  }
  
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String _radioValue = "grp1"; //Initial definition of radio button value
  String choice;

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          break;
        case 'two':
          choice = value;
          break;
        default:
          choice = "one";
      }
      //debugPrint(choice); //Debug the choice in console
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.title+" : ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: 'one',
          groupValue: _radioValue,
          onChanged: radioButtonChanges,
        ),
        Text(
          widget.first,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: 'two',
          groupValue: _radioValue,
          onChanged: radioButtonChanges,
        ),
        Text(
          widget.second,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
