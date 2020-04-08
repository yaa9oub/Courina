import 'dart:typed_data';

import 'package:conapp/button.dart';
import 'package:conapp/drawer.dart';
import 'package:conapp/news.dart';
import 'package:conapp/radiobtn.dart';
import 'package:conapp/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MySettingsPage extends StatefulWidget {
  @override
  _MySettingsPageState createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  List<Item> _data = generateItems(1);

  ///////////////////////////////////////////////NOTIFICATION////////////////////////////////////////////////////////
  ///////////////////////////////////////////////NOTIFICATION////////////////////////////////////////////////////////
  ///////////////////////////////////////////////NOTIFICATION////////////////////////////////////////////////////////

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    var android = new AndroidInitializationSettings('@drawable/icon');
    var iOS = new IOSInitializationSettings();

    var initSetttings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    //do nothing
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: Text("Settings"),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 300,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Positioned(
                              top: 10,
                              right: 10,
                              child: _RankWidgetBuilder("69"),
                            ),
                            Positioned(top: 40, child: _AvatarBuilder()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ExpansionPanelList(
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            _data[index].isExpanded = !isExpanded;
                          });
                        },
                        children: _data.map<ExpansionPanel>((Item item) {
                          return ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text(item.headerValue),
                              );
                            },
                            body: item.expandedValue,
                            isExpanded: item.isExpanded,
                          );
                        }).toList(),
                      ),
                      RadioButton("Reminder", "OFF", "ON"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton(
                  color: Colors.red[300],
                  onPressed: showNotification,
                  animationDuration: Duration(seconds: 1),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                  padding: EdgeInsets.only(left: 75,right: 75,top: 12.5 ,bottom: 12.5),
                  child: Text(
                    "Change",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  showNotification() {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,
        importance: Importance.Max,
        enableLights: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    flutterLocalNotificationsPlugin.show(
      0,
      'Warning !!',
      'Wear your gloves, mask and leave the safe distance !!',
      platform,
    );
  }
  /////////////////////////////////////////////////RANK BUILDER//////////////////////////////////////
  /////////////////////////////////////////////////RANK BUILDER//////////////////////////////////////
  /////////////////////////////////////////////////RANK BUILDER//////////////////////////////////////

  Widget _RankWidgetBuilder(String rank) {
    return Container(
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
              rank,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "RANK",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _SettingsBuilder() {
  return Container(
    padding: EdgeInsets.all(10),
    width: 300,
    child: Column(
      children: <Widget>[
        MyTextField("CHANGE NAME"),
        MyTextField("CHANGE PASSWORD"),
        MyTextField("CHANGE FIELD OF WORK"),
        MyTextField("CHANGE EMAIL"),
      ],
    ),
  );
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Profile settigns',
      expandedValue: _SettingsBuilder(),
    );
  });
}

//////////////////////////////////////////////// Avatar BUILDER /////////////////////////////////////
//////////////////////////////////////////////// Avatar BUILDER /////////////////////////////////////
//////////////////////////////////////////////// Avatar BUILDER /////////////////////////////////////
Widget _AvatarBuilder() {
  return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: NetworkImage(
                  "https://scontent.ftun3-1.fna.fbcdn.net/v/t1.0-9/p960x960/78978736_1807265879417740_4469266766907834368_o.jpg?_nc_cat=101&_nc_sid=7aed08&_nc_oc=AQnjdwRSD-bWWQwKMcQBBJoLWG1I8J2toC7suzsyLn8fTzyJG4YWsWZro3syh2IXlbU&_nc_ht=scontent.ftun3-1.fna&_nc_tp=6&oh=98b2128fd1677be4cf6572a6006be47f&oe=5EA90A19"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(75.0)),
          boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)]));
}

//////////////////////////////////////////////// Item expanded ///////////////////////////////////////////
//////////////////////////////////////////////// Item expanded ///////////////////////////////////////////
//////////////////////////////////////////////// Item expanded ///////////////////////////////////////////

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  Widget expandedValue;
  String headerValue;
  bool isExpanded;
}
