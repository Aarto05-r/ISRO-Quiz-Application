import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// void main() => runApp(new MyApp());

class Launchers extends StatefulWidget {
  @override
  State<Launchers> createState() => _LaunchersState();
}

class _LaunchersState extends State<Launchers> {
  // String get id => null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Fetch Data Example'),
      ),
      body: new Container(
        child: new FutureBuilder(
          future: fetchlaunchersData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var launchers = snapshot.data["launchers"];
              return new ListView.builder(
                  itemCount: launchers.length,
                  itemBuilder: (context, index) {
                    return new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(launchers[index]["id"].toString(),
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

  Future fetchlaunchersData() async {
    var url = Uri.parse('https://isro.vercel.app/api/launchers');
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
