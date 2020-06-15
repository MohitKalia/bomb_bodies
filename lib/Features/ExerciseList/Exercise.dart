import 'dart:async';
import 'package:bomb_bodies/Features/ExerciseList/ExerciseItem.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExercisePresenter.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExerciseView.dart';
import 'package:flutter/material.dart';

class Exercise extends StatefulWidget {
  @override
  ExerciseState createState() => ExerciseState();
}

class ExerciseState extends State<Exercise> implements ExerciseView {
  ExercisePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = new ExercisePresenter();
    presenter.setV(this);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace,
            size: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Legs & Glutes',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              // use stack feature
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 5),
              width: double.infinity,
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/header2.png',
                    ),
                    fit: BoxFit.fill),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                          20,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                "",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ExerciseItem(screenHeight, screenWidth, index);
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
