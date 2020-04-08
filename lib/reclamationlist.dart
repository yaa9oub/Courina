import 'package:conapp/button.dart';
import 'package:conapp/drawer.dart';
import 'package:conapp/reclamation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReclamationList extends StatefulWidget {
  @override
  _ReclamationListState createState() => _ReclamationListState();
}

class _ReclamationListState extends State<ReclamationList> {
  reclamation a =
      new reclamation("99101001", "A+", "Female", "3", "1", "4", "2", "25");
  reclamation b =
      new reclamation("95123654", "O-", "Female", "5", "1", "2", "2", "30");
  reclamation c =
      new reclamation("52489657", "B-", "Male", "4", "3", "4", "3", "69");

  List<reclamation> litems;

  Color fstCol = Colors.red;
  Color sndCol = Colors.pink[50];
  LinearGradient bgColor;

  @override
  void initState() {
    super.initState();
    litems = [a, b, c, c];
    bgColor = LinearGradient(
        colors: [fstCol, sndCol]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reclamation List"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: bgColor,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                child: Image.asset(
                  "images/virus.png",
                  height: 110,
                  width: 110,
                ),
                tag: "icon",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: new ListView.builder(
                    shrinkWrap: true,
                    itemCount: litems.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return _ItemBuilder(litems[Index], Index);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ItemBuilder(reclamation item, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          if (fstCol == Colors.red && sndCol == Colors.pink[50]) {
            bgColor = LinearGradient(
                colors: [Colors.pink[50], Colors.red],);
            sndCol = Colors.red;
            fstCol = Colors.pink[50];
          } else {
            bgColor = LinearGradient(
                colors: [Colors.red, Colors.pink[50]],);
            fstCol = Colors.red;
            sndCol = Colors.pink[50];
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: 210,
        decoration: BoxDecoration(
          color: (index % 2 == 0) ? Colors.red[100] : Colors.pink[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _SymptomBuilder("Sexe", item.sexe),
                  _SymptomBuilder("Fever", item.fever),
                  _SymptomBuilder("Cough", item.cough),
                  _SymptomBuilder("Sore throat", item.sore),
                  _SymptomBuilder("Breathing difficulties", item.breathing),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/virus.png",
                    height: 80,
                    width: 80,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _launchCaller(item.phone);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Help now",
                      style: TextStyle(
                        color: Colors.red[300],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _SymptomBuilder(String name, String deg) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          name + " : ",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        Text(
          deg,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }

  _launchCaller(tel) async {
    var url = "tel:$tel";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
