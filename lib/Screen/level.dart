import 'package:flutter/material.dart';
import 'package:isroquize/LoginScreen/RoundedButtonTP/rounded_button.dart';

import 'package:isroquize/Screen/quizpage.dart';

class Body extends StatelessWidget {
  String option;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ignore: missing_required_param
            //Background(),
            Text(
              "Select Question Level",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.10),

            RoundedButton(
              text: "Easy",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getjson(option)));
              },
            ),
            RoundedButton(
              text: "Medium",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getjson(option),
                    ));
              },
            ),
            RoundedButton(
              text: "Difficult",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getjson(option),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
