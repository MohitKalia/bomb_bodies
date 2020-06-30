import 'package:bomb_bodies/Features/ExerciseDetails/SubExercisePresenter.dart';
import 'package:bomb_bodies/Features/ExerciseDetails/SubExerciseView.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubExerciseList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'SubExerciseItem.dart';

class SubExercise extends StatefulWidget {
  @override
  SubExerciseS createState() => SubExerciseS();
}

class SubExerciseS extends State<SubExercise> implements SubExerciseView {
  SubExercisePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = new SubExercisePresenter();
    presenter.setV(this);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: screenHeight * 0.40,
            decoration: BoxDecoration(),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/header3.png'), fit: BoxFit.fill),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.keyboard_backspace,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 12, top: 30),
                            width: screenWidth / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Booty Building',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Container(
                                  child: Text(
                                    'Necessary Equipments:',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 3),
                                ),
                                Text(
                                  'Barbell, bentch, '
                                  'dumbblles',
                                  style: TextStyle(fontSize: 10, color: Colors.white),
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => SubExerciseList()));
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth > 400 ? 60 : 40,
                      vertical: screenWidth > 400 ? 10 : 5),
                  color: Colors.pink[300],
                  child: Text(
                    'Start Workout',
                    style: TextStyle(color: Colors.white, fontSize: screenWidth > 400 ? 20 : 15),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Exercises",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Divider(
                    color: Colors.grey,
                    height: 1.5,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext ctx, int index) {
                  return SubExerciseItem(screenHeight, screenWidth, index);
                }),
          ),
        ],
      ),
    );
  }

  @override
  double screenHeight;

  @override
  double screenWidth;

  @override
  bool showLoader;
}
