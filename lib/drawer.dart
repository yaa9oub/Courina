import 'package:conapp/home.dart';
import 'package:conapp/news.dart';
import 'package:conapp/maps.dart';
import 'package:conapp/ranks.dart';
import 'package:conapp/reclamation.dart';
import 'package:conapp/reclamationlist.dart';
import 'package:conapp/settings.dart';
import 'package:conapp/test.dart';
import 'package:conapp/volunteer.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Corona Virus App',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    "images/virus.png",
                    width: 80,
                    height: 80,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
            },
          ),
          ListTile(
            title: Text('Volunteer'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyVolunteerPage() ));
            },
          ),
          ListTile(
            title: Text('News'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyNewsPage() ));
            },
          ),
          ListTile(
            title: Text('Ranks'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyRankPage() ));
            },
          ),
          ListTile(
            title: Text('Reclamation'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ReclamationPage() ));
            },
          ),
          ListTile(
            title: Text('Reclamation List'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ReclamationList() ));
            },
          ),
          ListTile(
            title: Text('Maps'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyMapPage() ));
            },
          ),
          ListTile(
            title: Text('Corona Test'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> TestPage() ));
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MySettingsPage() ));
            },
          ),
        ],
      ),
    );
  }
}
