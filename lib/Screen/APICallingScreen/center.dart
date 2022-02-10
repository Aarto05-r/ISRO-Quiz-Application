import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Centers extends StatefulWidget {
  @override
  State<Centers> createState() => _CentersState();
}

class _CentersState extends State<Centers> {
  // String get id => null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Fetch Data Example'),
      ),
      body: new Container(
        child: new FutureBuilder(
          future: fetchCentersData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var centers = snapshot.data["centres"];
              return new ListView.builder(
                  itemCount: centers.length,
                  itemBuilder: (context, index) {
                    return new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(centers[index]["id"].toString(),
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(centers[index]["name"],
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(centers[index]["Place"],
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(centers[index]["State"],
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          new Divider()
                        ]);
                  });
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }

            // By default, show a loading spinner
            return new CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future fetchCentersData() async {
    var url = Uri.parse('https://isro.vercel.app/api/centres');
    var data = await http.get(
      url,
    );

    if (data.statusCode == 200) {
      var utfDecode = utf8.decode(data.bodyBytes);
      var response = json.decode(utfDecode);
      return response;
    } else {
      print(data.statusCode.toString());
    }
  }
}
