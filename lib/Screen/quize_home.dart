import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isroquize/Screen/level.dart';


class QuizeHome extends StatefulWidget {
  @override
  _QuizeHomeState createState() => _QuizeHomeState();
}

class _QuizeHomeState extends State<QuizeHome> {
  List<String> images = [
    "assets/istro.jpg",
    "assets/istro.jpg",
    "assets/istro.jpg",
  ];

  List<String> des = [
    "Lets Start The Quize About ISRO History !!",
    "Lets Start The Quize About ISRO General Knowldge !!",
    "Lets Start The Quize About ISRO Current Affairs !!",
  ];

  Widget customcard(String langname, String image, String des) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file
            // for a particular language
            builder: (context) => Body(),
          ));
        },
        child: Material(
          color: Colors.indigoAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Alike"),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          customcard("ISRO History", images[0], des[0]),
          customcard("ISRO GK", images[1], des[1]),
          customcard("Current Affairs", images[2], des[2]),
        ],
      ),
    );
  }
}
