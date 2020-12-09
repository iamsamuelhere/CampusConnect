import 'package:flutter/material.dart';

class CardsHome extends StatelessWidget {
 final int col1;
 final int col2;
 final String text;
 CardsHome({this.text,this.col1,this.col2});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
    

      width: double.infinity,
      height: 200.0,
      decoration: BoxDecoration(  
        gradient: LinearGradient(colors: [
          Color(col1),
          Color(col2),

        ]),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Stack(children: [
        Opacity(
          opacity: 1,),
         Center(child: Text("Announcements",style: TextStyle(fontSize: 20.0),)),
      ],                
      ),
    );
  }
}
