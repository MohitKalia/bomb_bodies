import 'package:bomb_bodies/Features/ExerciseList/Exercise.dart';
import 'package:bomb_bodies/Features/Home/DummyData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeRowItems extends StatelessWidget {
  final int index;

  HomeRowItems(this.index);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        if (index == 0) {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => Exercise()));
        }
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.22,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(DUMMYDATA[index].imageUrl)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${DUMMYDATA[index].exercise}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          fontSize: 25),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
