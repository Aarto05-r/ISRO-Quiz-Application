import 'package:flutter/material.dart';
import 'package:isroquize/LoginScreen/RoundedButtonTP/rounded_button.dart';
import 'package:isroquize/Screen/APICallingScreen/center.dart';
import 'package:isroquize/Screen/APICallingScreen/customer_satellite.dart';
import 'package:isroquize/Screen/APICallingScreen/launchers.dart';
import 'package:isroquize/Screen/APICallingScreen/spacecreaftapi.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // ignore: missing_required_param
                //Background(),
                Text(
                  "Istro Details",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.10),

                RoundedButton(
                  text: "Spacecreaft Details",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Spacecreafts(),
                        ));
                  },
                ),
                RoundedButton(
                  text: "Launcher Details",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Launchers()));
                  },
                ),
                RoundedButton(
                  text: "Customer Satellite Details",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Customer_Satellight(),
                        ));
                  },
                ),
                RoundedButton(
                  text: "Centers Details",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Centers(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
