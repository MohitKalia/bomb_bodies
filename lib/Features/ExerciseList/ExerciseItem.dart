import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/Features/ExerciseDetails/SubExercise.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExerciseDummyData.dart';
import 'package:flutter/material.dart';

class ExerciseItem extends StatefulWidget {
  final height, width;
  int index;

  ExerciseItem(this.height, this.width, this.index);

  @override
  ExerciseItemS createState() => ExerciseItemS();
}

class ExerciseItemS extends State<ExerciseItem> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        margin: EdgeInsets.only(bottom: 7),
        padding: EdgeInsets.symmetric(vertical: 22),
        width: double.infinity,
        height: widget.height * 0.18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.lightBlueAccent.withOpacity(0.1), width: 2.1)),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerLeft,
              width: widget.width * 0.20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(EXERCISEDUMMYDATA[widget.index].day), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100), bottomRight: Radius.circular(100))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100), bottomLeft: Radius.circular(100))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: widget.width - 137,
                    padding: EdgeInsets.fromLTRB(20, 6, 10, 6),
                    //color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Text(
                            EXERCISEDUMMYDATA[widget.index].exercise,
                            style: TextStyle(
                                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(bottom: 3),
                        ),
                        Text(
                          EXERCISEDUMMYDATA[widget.index].imageUrl,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                          style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      color: primaryColors['primary'],
                      child: Icon(
                        Icons.trending_flat,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      color: Colors.white,
      padding: EdgeInsets.all(5),
      onPressed: () {
        if (widget.index == 0) {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) => SubExercise()));
        }
      },
    );
  }
}
