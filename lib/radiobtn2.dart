import 'package:flutter/material.dart';

class MyRadioButtons extends StatefulWidget {
  
  @override
  _MyRadioButtonsState createState() => _MyRadioButtonsState();
}

class _MyRadioButtonsState extends State<MyRadioButtons> {
  String _radioValue ; //Initial definition of radio button value
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(5) 
      ),
      margin : EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("1",style: TextStyle(
              color: Colors.grey[200],
              fontSize: 16,
            ),),
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: '1',
            groupValue: _radioValue,
            onChanged: radioButtonChanges,
          ),
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: '2',
            groupValue: _radioValue,
            onChanged: radioButtonChanges,
          ),
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: '3',
            groupValue: _radioValue,
            onChanged: radioButtonChanges,
          ),
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: '4',
            groupValue: _radioValue,
            onChanged: radioButtonChanges,
          ),
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: '5',
            groupValue: _radioValue,
            onChanged: radioButtonChanges,
          ),
          Text("5",style: TextStyle(
              color: Colors.grey[200],
              fontSize: 16,
            ),),
        ],
      ),
    );
  }
}
