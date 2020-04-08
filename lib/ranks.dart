import 'package:conapp/drawer.dart';
import 'package:flutter/material.dart';

class MyRankPage extends StatefulWidget {
  @override
  _MyRankPageState createState() => _MyRankPageState();
}

class _MyRankPageState extends State<MyRankPage> {
///////////////////////////////////////////////////////////////TOP/////////////////////////////////////////////
///////////////////////////////////////////////////////////////TOP/////////////////////////////////////////////
///////////////////////////////////////////////////////////////TOP/////////////////////////////////////////////

  item a = new item("Ahmed Zaghdoudi", "zaghdoudi.ahmed@gmail.com", 111,
      "https://scontent.ftun3-1.fna.fbcdn.net/v/t1.0-9/21687772_1186808568130116_777318160925653821_n.jpg?_nc_cat=101&_nc_sid=85a577&_nc_oc=AQnTPhCF8TE5tnMRjOx9rqIsCs4oG-hFbKl-Uso9iakR4-HhUL6uF76Tm287fRyP3nc&_nc_ht=scontent.ftun3-1.fna&oh=fc66c5527370bfc956fdd67bd493d51e&oe=5EA7D2D0");
  item b = new item("Anas Hamdoun", "hamdoun.anas@gmail.com", 100,
      "https://scontent.ftun3-1.fna.fbcdn.net/v/t1.0-9/p960x960/88336116_1113917715624007_6893690434434891776_o.jpg?_nc_cat=111&_nc_sid=85a577&_nc_oc=AQngaR-ZSQbDyO4eUI84mUulvYbjohlMMRc3hvSIDaKXKu8gcq1ydr6eEX6e9ZooOIo&_nc_ht=scontent.ftun3-1.fna&_nc_tp=6&oh=b4173218f375b112f61c40d848082d0a&oe=5EA9B374");
  item c = new item("Zahreddine Atoui", "zahry.atoui@gmail.com", 80,
      "https://scontent.ftun3-1.fna.fbcdn.net/v/t1.0-9/88445895_2737919639589033_8005155037800038400_n.jpg?_nc_cat=101&_nc_sid=85a577&_nc_oc=AQkzRO-OUSYD7E9HzXi5tVMQ079SqsV6vvtRFiwfYISToMuC6_8puxUZpFwiq0ScH24&_nc_ht=scontent.ftun3-1.fna&oh=681621683c98b568468ca661abe509b0&oe=5EAB5083");
  item d = new item("Seyf Yacoub", "seyf.yagoub@gmail.com", 69,
      "https://scontent.ftun3-1.fna.fbcdn.net/v/t1.0-9/p960x960/78978736_1807265879417740_4469266766907834368_o.jpg?_nc_cat=101&_nc_sid=7aed08&_nc_oc=AQnjdwRSD-bWWQwKMcQBBJoLWG1I8J2toC7suzsyLn8fTzyJG4YWsWZro3syh2IXlbU&_nc_ht=scontent.ftun3-1.fna&_nc_tp=6&oh=98b2128fd1677be4cf6572a6006be47f&oe=5EA90A19");
  List<item> litems;

  @override
  void initState() {
    super.initState();
    litems = [a, b, c, d];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rank"),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Colors.pink[200]])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "images/virus.png",
                  width: 80,
                  height: 80,
                ),
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
        ));
  }

////////////////////////////////////////////////////////// ITEM BUILDER /////////////////////////////////////////
////////////////////////////////////////////////////////// ITEM BUILDER /////////////////////////////////////////
////////////////////////////////////////////////////////// ITEM BUILDER /////////////////////////////////////////

  Widget _ItemBuilder(item a, int i) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  image: DecorationImage(
                      image: NetworkImage(a.img), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                  boxShadow: [
                    BoxShadow(blurRadius: 7.0, color: Colors.black)
                  ])),
          Text("Hero lvl :"+a.rank.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color : Colors.red[400]),),
          Text(a.name,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,color : Colors.red[300]),),
          Text(a.email,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color : Colors.red[100]),),
        ],
      ),
    );
  }
}

class item {
  String name, email, img;
  int rank;
  item(n, e, r, i) {
    name = n;
    email = e;
    rank = r;
    img = i;
  }
}
