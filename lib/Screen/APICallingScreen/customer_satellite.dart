import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Customer_Satellight extends StatefulWidget {
  @override
  State<Customer_Satellight> createState() => _Customer_SatellightState();
}

class _Customer_SatellightState extends State<Customer_Satellight> {
  // String get id => null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Fetch Data Example'),
      ),
      body: new Container(
        child: new FutureBuilder(
          future: fetchcustomer_satellitesData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var customer_satellites = snapshot.data["customer_satellites"];
              return new ListView.builder(
                  itemCount: customer_satellites.length,
                  itemBuilder: (context, index) {
                    return new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(customer_satellites[index]["id"].toString(),
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(customer_satellites[index]["country"],
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(
                              customer_satellites[index]["launch_date"]
                                  .toString(),
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(customer_satellites[index]["mass"],
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                          new Text(customer_satellites[index]["launcher"],
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

  Future fetchcustomer_satellitesData() async {
    var url = Uri.parse('https://isro.vercel.app/api/customer_satellites');
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
