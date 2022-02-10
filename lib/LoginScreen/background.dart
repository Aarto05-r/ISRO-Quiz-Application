import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 300,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 60,
            left: 120,
            bottom: -60,
            child: Image.asset(
              "assets/istro.jpg",
              width: size.width * 0.25,
            ),
          ),
        ],
      ),
    );
  }
}
