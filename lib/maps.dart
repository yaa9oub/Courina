import 'package:conapp/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapPage extends StatefulWidget {
  @override
  _MyMapPageState createState() => new _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {

  List<Marker> markers = [];

  Map<int, state> tunisia = {
    1: new state("Tunis", LatLng(36.806112,10.171078), 144),
    2: new state("Ariana", LatLng(36.860117, 10.193371), 76),
    3: new state("Ben Arous", LatLng(36.753056, 10.218889), 61),
    4: new state("Mannouba", LatLng(36.808029, 10.097205), 31),
    5: new state("Nabeul", LatLng(36.60, 10.44), 11),
    6: new state("Zaghouen", LatLng(36.402907, 10.142925), 02),
    7: new state("Bizerte", LatLng(37.15, 9.50), 16),
    8: new state("Beja", LatLng(36.43, 09.12), 02),
    9: new state("Kef", LatLng(36.174239, 8.704863), 05),
    10: new state("Sousse", LatLng(35.825388, 10.636991), 57),
    11: new state("Monastir", LatLng(35.783333, 10.833333), 26),
    12: new state("Mahdia", LatLng(35.28, 11.0), 11),
    13: new state("Sfax", LatLng(34.740556, 10.760278), 29),
    14: new state("Kairouan", LatLng(35.45, 10.05), 05),
    15: new state("Gasserine", LatLng(35.167578, 8.836506), 02),
    16: new state("Sidi Bouzid", LatLng(35.038234, 9.484935), 05),
    17: new state("Gabes", LatLng(33.881457, 10.098196), 09),
    18: new state("Medinine", LatLng(33.354947, 10.505478), 62),
    19: new state("Tatouine", LatLng(32.929674, 10.451767), 18),
    20: new state("Gafsa", LatLng(34.24, 8.43), 11),
    21: new state("Tozeur", LatLng(33.919683, 8.13352), 01),
    22: new state("Gbeli", LatLng(33.704387, 8.969034), 39)
  };

  @override
  void initState() {
    super.initState();

    for (int x = 1;  x <23; x++) {
      _addMarker(tunisia[x].name, tunisia[x].position , tunisia[x].numInf);
    }    
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: LatLng(36.81897, 10.16579),
          zoom: 5,
        ),
        markers: Set<Marker>.of(markers),
      ),
    );
  }

  _addMarker(name,LatLng pos,num){

    markers.add(
      Marker(
        markerId: MarkerId(name),
        draggable: false,
        position: new LatLng(pos.latitude , pos.longitude),
        infoWindow: InfoWindow(
          title: name+" : "+num.toString(),
        ),
        flat: true,
      ),
    );
  }



}

class state {
  String name;
  LatLng position;
  int numInf;
  state(n, p, ni) {
    name = n ;
    numInf = ni ;
    position = p ; 
  }
}
