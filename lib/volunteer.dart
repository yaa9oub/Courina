import 'package:conapp/drawer.dart';
import 'package:conapp/textField.dart';
import 'package:flutter/material.dart';

class MyVolunteerPage extends StatefulWidget {
  @override
  _MyVolunteerPageState createState() => _MyVolunteerPageState();
}

class _MyVolunteerPageState extends State<MyVolunteerPage> {
///////////////////////////////////////////////////////////////TOP/////////////////////////////////////////////
///////////////////////////////////////////////////////////////TOP/////////////////////////////////////////////
///////////////////////////////////////////////////////////////TOP/////////////////////////////////////////////

  String cat = null;

  ///text cotrl for textfield
  final TextEditingController text1 = new TextEditingController();
  final TextEditingController text2 = new TextEditingController();

  @override
  void dispose() {
    text1.dispose();
    text2.dispose();
    super.dispose();
  }

  //Spinner
  List<DropdownMenuItem<String>> listDrop = [];

  void loadData() {
    listDrop = [];
    listDrop.add(new DropdownMenuItem(
      child: new Text("Ideas"),
      value: "Ideas",
    ));
    listDrop.add(new DropdownMenuItem(
      child: new Text("Service"),
      value: "Service",
    ));
    listDrop.add(new DropdownMenuItem(
      child: new Text("Material"),
      value: "Material",
    ));
  }

  //ITEM LIST DATA
  item a = new item("Tissu", "I can afford you with 1km² of 9mech.", "Material",
      224, Colors.green[300], Colors.red[300]);
  item b = new item(
      "Application",
      "I have an idea of an application that can help doctors.",
      "Ideas",
      124,
      Colors.green[300],
      Colors.red[300]);
  item c = new item("Developer", "I can develop your idea using android",
      "Service", 69, Colors.green[300], Colors.red[300]);
  List<item> litems;

  @override
  void initState() {
    super.initState();
    litems = [a, b, c];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volunteer"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Colors.pink[200]
            ])),
            child: Column(
              children: <Widget>[
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
          Positioned(
            bottom: 5,
            right: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  addItem(context);
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////// ITEM BUILDER /////////////////////////////////////////
////////////////////////////////////////////////////////// ITEM BUILDER /////////////////////////////////////////
////////////////////////////////////////////////////////// ITEM BUILDER /////////////////////////////////////////

  Widget _ItemBuilder(item a, int i) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (i % 2 == 0) ? Colors.blueAccent : Colors.redAccent,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                a.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                a.categorie,
                style: TextStyle(
                    fontSize: 14, fontFamily: "Montserrat", color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                a.description,
                style: TextStyle(fontSize: 16, fontFamily: "Montserrat"),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: Container(
          margin: EdgeInsets.all(10),
          width: 60,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.pink[300],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  a.rank.toString(),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "UPS",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: -15,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    if (a.upCol == Colors.grey) {
                      setState(() {
                        litems[i].rank--;
                        a.upCol = Colors.green[300];
                      });
                    } else {
                      if (a.downCol != Colors.grey) {
                        setState(() {
                          litems[i].rank++;
                          a.upCol = Colors.grey;
                        });
                      }
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: a.upCol,
                  ),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  "CLICK FOR CONTACT",
                  style: TextStyle(fontSize: 16, color: Colors.red[400]),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  if (a.downCol == Colors.grey) {
                    setState(() {
                      litems[i].rank++;
                      a.downCol = Colors.red[300];
                    });
                  } else {
                    if (a.upCol != Colors.grey) {
                      setState(() {
                        litems[i].rank--;
                        a.downCol = Colors.grey;
                      });
                    }
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: a.downCol,
                  ),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

////////////////////////////////////////////////// POP UP ///////////////////////////////////////////////////
////////////////////////////////////////////////// POP UP ///////////////////////////////////////////////////
////////////////////////////////////////////////// POP UP ///////////////////////////////////////////////////

  addItem(BuildContext context) {
    loadData();
    Widget okButton = FlatButton(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          "Ok",
          style: TextStyle(color: Colors.red[400]),
        ),
      ),
      onPressed: () {
        item a = new item(
            text1.text, text2.text, cat, 0, Colors.green[300], Colors.red[300]);
        _addItemList(a);
        text1.text = "";
        text2.text = "";
        Navigator.of(context).pop();
      },
    );

    Widget cancelButton = FlatButton(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          "Cancel",
          style: TextStyle(color: Colors.red[400]),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        //side: BorderSide(color: Colors.black),
      ),
      title: Text(
        "Volunteer now ",
        style: TextStyle(color: Colors.red[400]),
      ),
      backgroundColor: Colors.red[200],
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        height: MediaQuery.of(context).size.height / 3,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: false,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Title",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  controller: text1,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: false,
                  autofocus: false,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Description",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  controller: text2,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.category, color: Colors.white),
                    DropdownButton(
                      items: listDrop,
                      hint: Text(
                        "Category",
                        style: TextStyle(color: Colors.white),
                      ),
                      onChanged: (String changedValue) {
                        setState(() {
                          cat = changedValue;
                        });
                      },
                      value: (cat != null) ? cat : null,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      actions: [
        okButton,
        cancelButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _addItemList(item a) {
    if (a.title != "" && a.description != "" && a.categorie != null) {
      litems.add(a);
      text1.clear();
      setState(() {});
    }
  }
}

////////////////////////////////////////////////////////// CLASS ITEM /////////////////////////////////////////
////////////////////////////////////////////////////////// CLASS ITEM /////////////////////////////////////////
////////////////////////////////////////////////////////// CLASS ITEM /////////////////////////////////////////

class item {
  String title, description, categorie;
  int rank;
  Color upCol, downCol;

  item(t, d, c, r, up, down) {
    title = t;
    description = d;
    categorie = c;
    upCol = up;
    downCol = down;
    rank = r;
  }
}
