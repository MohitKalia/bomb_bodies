import 'package:bomb_bodies/Features/ExerciseDetails/SubExerciseDummyData.dart';
import 'package:bomb_bodies/Features/StartExercise/VideoScreen.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubExerciseListDummyData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubListExerciseItem extends StatelessWidget {
  final height, width;
  int index;

  SubListExerciseItem(this.height, this.width, this.index);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        margin: EdgeInsets.only(bottom: 7),
        padding: EdgeInsets.symmetric(vertical: 22),
        width: double.infinity,
        height: height * 0.18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            shape: BoxShape.rectangle,
            border: Border.all(
                color: Colors.lightBlueAccent.withOpacity(0.1), width: 2.1)),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerLeft,
              width: width * 0.20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(SUBEXERCISEListDUMMYDATA[index].day),
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
                    width: width - 105,
                    padding: EdgeInsets.fromLTRB(30, 6, 10, 6),
                    //color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Text(
                            SUBEXERCISEListDUMMYDATA[index].exercise,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(bottom: 3),
                        ),
                        Text(
                          SUBEXERCISEListDUMMYDATA[index].imageUrl,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      color: Colors.white,
      padding: EdgeInsets.all(5),
      onPressed: () {
        if (index == 0 || index == 1 || index == 2) {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => VideoScreen()));
        }
      },
    );
  }
}
