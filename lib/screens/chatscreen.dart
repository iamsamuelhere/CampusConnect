import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'chatLogin.dart';

class ChatScreen extends StatefulWidget {
  User user;
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  signout() async {
    await GoogleSignIn().signOut().then((value) {
      return Navigator.pop(context);
    });
  }
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                signout();
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [Text("${widget.user}")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Send message...",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
                Expanded(
                    child: CircleAvatar(
                  child: Icon(Icons.send, color: Colors.white),
                  backgroundColor: Colors.green,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
