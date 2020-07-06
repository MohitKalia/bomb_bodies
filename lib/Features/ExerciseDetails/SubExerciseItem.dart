
import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/Features/ExerciseDetails/SubExerciseDummyData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubExerciseItem extends StatelessWidget {
  final height, width;
  int index;

  SubExerciseItem(this.height, this.width, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all( 7),
      padding: EdgeInsets.symmetric(vertical: 13),
      width: double.infinity,
      height: height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(
              color: Colors.black.withOpacity(0.2), width: 3)),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.centerLeft,
            width: width * 0.20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(SUBEXERCISEDUMMYDATA[index].day),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: width - 114,
                  padding: EdgeInsets.fromLTRB(30, 6, 10, 6),
                  //color: Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        SUBEXERCISEDUMMYDATA[index].sets,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      Container(
                        child: Text(
                          SUBEXERCISEDUMMYDATA[index].exercise,
                          style: TextStyle(
                              fontSize: 16,
                              color: primaryColors['blue'],
                              fontWeight: FontWeight.bold),
                        ),
                        margin: EdgeInsets.only(bottom: 3),
                      ),
                      Text(
                        SUBEXERCISEDUMMYDATA[index].imageUrl,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyle(fontSize: 12, color: primaryColors['blue']),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
