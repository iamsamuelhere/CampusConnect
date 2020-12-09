import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chatscreen.dart';
class ChatLogin extends StatelessWidget {
  const ChatLogin({
    Key key,
  }) : super(key: key);
  
  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        children: [
           Image.asset("images/signup.png"),
           Container(
             margin: EdgeInsets.only(top:50.0),
             child: RaisedButton(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
               onPressed: ()async{
                 await signInWithGoogle().then((value){
                   if(value!=null){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(
                        user: value.user,
                      )));
                   }
                   else{
                     Text("-------------------------Failed");
                   }
                 });
                 
               }
               ,child: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                 Icon(FontAwesomeIcons.google),
                 SizedBox(width: 20.0,),
                 Text("Continue with Google")
               ],),),
           )
        ],
      ),
    );
  }
}