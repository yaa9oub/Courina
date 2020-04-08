import 'package:conapp/button.dart';
import 'package:conapp/radiobtn.dart';
import 'package:conapp/radiobtn2.dart';
import 'package:conapp/textField.dart';
import 'package:flutter/material.dart';
import 'package:conapp/drawer.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Color bgColor = Colors.red[100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conolia Test"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red[200], Colors.red[50]]),
          ),
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
                  width: MediaQuery.of(context).size.width * 4 / 5,
                  child: Column(
                    //scrollDirection: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _SymptomsBuild("Fever degree"),
                      _SymptomsBuild("Headache degree"),
                      _SymptomsBuild("Cough degree"),
                      _SymptomsBuild("Breathing difficulties"),
                      _SymptomsBuild("Sore throat"),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                //side: BorderSide(color: Colors.black),
                              ),
                              title: new Text(
                                'Result',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              content: new Text("Congrats you're fine !!"),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [Colors.red, Colors.white]),
                          ),
                          child: Text(
                            "Check",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
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

class reclamation {
  String phone, blood, sexe, fever, cough, breathing, sore, age;
  reclamation(p, b, s, f, c, br, so, a) {
    phone = p;
    blood = b;
    sexe = s;
    fever = f;
    cough = c;
    breathing = br;
    sore = so;
    age = a;
  }
}
