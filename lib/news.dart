import 'package:conapp/maps.dart';
import 'package:flutter/material.dart';
import 'package:conapp/drawer.dart';

class MyNewsPage extends StatefulWidget {
  @override
  _MyNewsPageState createState() => _MyNewsPageState();
}

class _MyNewsPageState extends State<MyNewsPage> {
  ScrollController _controller;

  List<news> litems;

  news a = new news(
      "Coronavirus cases in the world:", "1,411,348", "07/04/2020", "");
  news b =
      new news("Coronavirus deaths in the world:", "81,049", "07/04/2020", "");
  news c = new news(
      "Coronavirus recovery in the world:", "300,759", "07/04/2020", "");
  news d = new news(
      "Coronavirus cases in Tunisia:", "623", "07/04/2020", "Click for more !!");

  Color fstCol = Colors.red;
  Color sndCol = Colors.pink[50];
  LinearGradient bgColor;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    bgColor = LinearGradient(
        colors: [fstCol, sndCol],
        begin: Alignment.centerLeft,
        end: Alignment.bottomRight);
    litems = [a, b, c, d];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News"),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [sndCol, fstCol])),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
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
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: new ListView.builder(
                      controller: _controller,
                      shrinkWrap: true,
                      itemCount: litems.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return _ItemBuild(litems[Index], Index);
                      }),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 5,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      _ItemBuilder("images/gloves.png", "Wear Gloves",
                          "You shouldn't wear gloves \nunless they remind you to \navoid touching your face, \ndoctors say."),
                      _ItemBuilder("images/distance.png", "Respect distance",
                          "People who live together\nand are regular partners can be\nin normal contact."),
                      _ItemBuilder("images/home.png", "Stay home",
                          "The TN government is advising \npeople stay home and only go\nout if they need to fetch\nfood or medicine."),
                      _ItemBuilder("images/mask.png", "Wear mask",
                          "Wear a mask if you are \ncoughing or sneezing."),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _ItemBuilder(String imgPath, String title, String desc) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 100,
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            imgPath,
            width: 80,
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[400])),
                Text(desc,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 12, color: Colors.red[200])),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _ItemBuild(news item, int index) {
    return InkWell(
      onTap: (){
        if(item.source != ""){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyMapPage() ));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          width: MediaQuery.of(context).size.width / 2,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                item.title,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  item.desciption,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    wordSpacing: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    item.source,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[100]),
                  ),
                  Text(
                    item.date,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[200]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        fstCol = Colors.pink[50];
        sndCol = Colors.red;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        fstCol = Colors.red;
        sndCol = Colors.pink[50];
      });
    }
  }
}

class news {
  String title, desciption, date, source;

  news(t, d, da, s) {
    title = t;
    desciption = d;
    date = da;
    source = s;
  }
}
