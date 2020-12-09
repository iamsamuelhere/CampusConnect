import 'package:CampusConnect/screens/chatLogin.dart';
import 'package:CampusConnect/screens/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      routes: {
        "/":(context)=>Home(),
        "/chat":(context)=>ChatScreen(),
        "/chatlogin":(context)=>ChatLogin()

      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}