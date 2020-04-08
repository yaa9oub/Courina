import 'package:conapp/button.dart';
import 'package:conapp/radiobtn.dart';
import 'package:conapp/radiobtn2.dart';
import 'package:conapp/reclamationlist.dart';
import 'package:conapp/textField.dart';
import 'package:flutter/material.dart';
import 'package:conapp/drawer.dart';

class ReclamationPage extends StatefulWidget {
  ReclamationPage({Key key}) : super(key: key);

  @override
  _ReclamationPageState createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {

  Color bgColor = Colors.red[100];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reclamation"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: bgColor,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset(
                  "images/virus.png",
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left:35,right: 35,top:10,bottom: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red[300], Colors.red[200]]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                    ),
                  ),
                  //width: MediaQuery.of(context).size.width * 5 / 6,
                  child: Column(
                    //scrollDirection: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MyTextField("Phone Number"),
                      MyTextField("Blood Type "),
                      RadioButton("Sexe", "Male", "Female"),
                      _SymptomsBuild("Fever degree"),
                      _SymptomsBuild("Cough degree"),
                      _SymptomsBuild("Breathing difficulties"),
                      _SymptomsBuild("Sore throat"),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ReclamationList() ));
                        },
                        child: MyButton("Send")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _SymptomsBuild(String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            color: Colors.grey[200],
            fontSize: 16,
          ),
        ),
        MyRadioButtons(),
      ],
    );
  }
}

class reclamation{
  String phone , blood , sexe , fever , cough , breathing , sore ,age ;
  reclamation(p,b,s,f,c,br,so,a){
    phone = p ;
    blood = b ;
    sexe = s ;
    fever = f ;
    cough = c ;
    breathing = br ;
    sore = so ;
    age = a ;
  }
}