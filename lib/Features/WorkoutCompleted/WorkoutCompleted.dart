import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/Widgets/ButtonRC.dart';
import 'package:flutter/material.dart';

class WorkoutCompleted extends StatefulWidget {
  final String name;

  WorkoutCompleted(this.name);

  @override
  WorkoutCompletedState createState() => WorkoutCompletedState();
}

class WorkoutCompletedState extends State<WorkoutCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12),
        color: primaryColors['primary'],
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 37),),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Hooray! Workout Complete.", style:
              TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w600),),
            ),

            Padding(padding: EdgeInsets.symmetric(vertical: 17),),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(widget.name,style: TextStyle(fontSize: 16, color: Colors.white),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Text("Workout name",style: TextStyle(fontSize: 13, color: Colors.white),),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 27),),
            Container(
              width: MediaQuery.of(context).size.width-100,
              child: ButtonRC("Dismiss", (){
                for(int i = 0; i < 6; i++) {
                  Navigator.of(context).pop();
                }
              }, Colors.grey, Colors.black),
            )
          ],
        ),
      ),
    );
  }
}