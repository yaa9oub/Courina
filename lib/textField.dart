import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  String hText;
  TextEditingController editor = new TextEditingController();
  
  MyTextField(hText){
    this.hText = hText;
  }
  
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
                  autocorrect: false,
                  autofocus: false,
                  style: TextStyle(color: Colors.red[400]),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        prefixIcon: (widget.hText == "PHONE NUMBER")
            ? Icon(
                Icons.phone_iphone,
                color: Colors.red,
              )
            : (widget.hText =="PASSWORD" || widget.hText =="CONFIRM PASSWORD") ?
            Icon(
                Icons.lock_outline,
                color: Colors.red,
              )
            : null,
        hintText: widget.hText,
        hintStyle: TextStyle(
          color: Colors.grey[200],
          fontSize: 16,
        ),
        errorText:
            (widget.editor.text.isEmpty) ? "Please fill in the blanks !!" : null,
      ),
      obscureText: widget.hText == "PASSWORD" || widget.hText == "CONFIRM PASSWORD" ? true : false,
    );
  }
}