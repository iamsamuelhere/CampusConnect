import 'package:CampusConnect/Components/widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'chatLogin.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: "Chat",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.leaderboard),
      label: "Results",
    ),
  ];
  int selindex = 0;

  List<Widget> content = [
    //first item
    ListView(
      children: [
        CardsHome(
          col1: 0xffc94b4b,
          col2: 0xff4b134f,
          text: "Announcements",
        ),
        CardsHome(
          col1: 0xffc31432,
          col2: 0xff240b36,
          text: "Announcements",
        ),
        CardsHome(
          col1: 0xff0084,
          col2: 0xff33001b,
          text: "Announcements",
        ),
        CardsHome(
          col1: 0xffee0979,
          col2: 0xffff6a00,
          text: "Announcements",
        ),
      ],
    ),
    //second item
    ChatLogin(),
    //Third item
    WebView(
      initialUrl: 'https://www.vtu4u.com/',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: RichText(
              text: TextSpan(
                  text: "Campus",
                  style: TextStyle(fontSize: 20.0),
                  children: [
                TextSpan(text: " Connect", style: TextStyle(color: Colors.red))
              ]))),
      body: content[selindex],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: selindex,
        onTap: (int tap) {
          setState(() {
            selindex = tap;
          });
        },
        selectedItemColor: Colors.red,
      ),
    );
  }
}
