

import 'package:flutter/material.dart';
import 'package:isroquize/Screen/home_screen.dart';
import 'package:isroquize/Screen/quize_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = 0;
  final List pages = [
    HomeScreen(),
    QuizeHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Istro Quize App'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 12),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ISRO Quize App",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF343E87),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              trailing: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        currentIndex: _selectedItemIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _selectedItemIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz_outlined),
            title: Text("Quize"),
          ),
        ],
      ),
      body: SizedBox.expand(child: pages[_selectedItemIndex]),
      //),
    );
  }
}
