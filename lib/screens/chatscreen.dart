import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  TextEditingController chatmsg = TextEditingController();
  CollectionReference msg = FirebaseFirestore.instance.collection("Chat");
  sendmsg() async {
    await msg.add({
      "Name": widget.user.displayName,
      "msg": chatmsg.text,
      "photo": widget.user.photoURL,
      "uid": widget.user.uid,
      "date": DateTime.now()
    }).then((value) => {print("Added")});
  }

  bool isme = false;
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
            child: StreamBuilder(
              stream: msg.snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data.documents[index];
                      if (doc["uid"] == widget.user.uid) {
                        isme = true;
                      } else {
                        isme = false;
                      }
                      return Row(
                         mainAxisAlignment: isme?MainAxisAlignment.end:MainAxisAlignment.start,
                        children: [
                           
                          Column(
                          
                            children: [
                              Container(
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  color: isme ? Colors.red : Colors.blue,

                                  ),
                                

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${doc['msg']}",style: TextStyle(fontSize: 20.0),),
                                        Text("${doc['Name']}",style: TextStyle(fontSize: 15.0,color: Colors.grey),),
                                        

                                      ],
                                    ),
                                  )),
                                  
                            ],
                          ),
                        isme? Icon(Icons.delete,color: Colors.redAccent,):Text("")
                        ],
                      );
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                    child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(widget.user.photoURL))),
                SizedBox(width: 5),
                Expanded(
                  flex: 6,
                  child: TextFormField(
                    controller: chatmsg,
                    minLines: 1,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: "Send message...",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                    child: CircleAvatar(
                  radius: 30,
                  child: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        sendmsg();
                        chatmsg.clear();
                      }),
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
