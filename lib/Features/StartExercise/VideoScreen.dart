import 'dart:async';

import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/BaseUtils/GlobalUtils.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExerciseDummyData.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubExerciseListDummyData.dart';
import 'package:bomb_bodies/Widgets/ButtonRC.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final List data;

  VideoScreen(this.data);

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _playerController;
  int selectedExercise = 0;
  SubExerciseListDummyModel m, next;

  @override
  void initState() {
    _playerController = VideoPlayerController.network(
        'https://brainupca.com/fitv1/public/storage/subserviceImages/image_gif20200611131454.m4v')
      ..initialize().then((value) {
        setState(() {});
      });
    setState(() {
      _playerController.play();
    });
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          '',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 400,
            child: Stack(
              children: <Widget>[
                m.imageUrl.isEmpty
                    ? Container(
                        alignment: Alignment.center,
                        child: new CircularPercentIndicator(
                          radius: 120.0,
                          lineWidth: 5.0,
                          percent:
                              double.tryParse("0." + (_start + _start / 10).toInt().toString()),
                          center: Text((_start).toInt().toString() + " Seconds"),
                          progressColor: Colors.green,
                        ),
                      )
                    : Center(
                        child: _playerController.value.initialized
                            ? AspectRatio(
                                aspectRatio: _playerController.value.aspectRatio,
                                child: VideoPlayer(_playerController),
                              )
                            : Container(),
                      ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(m.exercise),
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.33 - 12,
                margin: EdgeInsets.symmetric(horizontal: 9),
                child: RaisedButton(
                  padding: EdgeInsets.all(5),
                  onPressed: () {
                    if (selectedExercise > 0) selectedExercise--;
                    if (_start != 90) _timer.cancel();
                    _start = 90;
                    setData();
                  },
                  child: Icon(
                    Icons.skip_previous,
                    size: 40,
                    color: primaryColors['primary'],
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  padding: EdgeInsets.all(5),
                  onPressed: () {
                    setState(() {
                      _playerController.value.isPlaying
                          ? _playerController.pause()
                          : _playerController.play();
                    });
                  },
                  child: Icon(
                    _playerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 40,
                    color: primaryColors['primary'],
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.33 - 12,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.33 - 12,
                margin: EdgeInsets.symmetric(horizontal: 9),
                child: RaisedButton(
                  padding: EdgeInsets.all(5),
                  onPressed: () {
                    if (widget.data.length > selectedExercise + 1) selectedExercise++;
                    if (_start != 90) _timer.cancel();
                    _start = 90;
                    setData();
                  },
                  child: Icon(
                    Icons.skip_next,
                    size: 40,
                    color: primaryColors['primary'],
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 22),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.18,
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
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: Text(next.day == "Up next" ? "   " + next.day : ""),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(next.day), fit: BoxFit.fill),
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
                        width: MediaQuery.of(context).size.width - 97,
                        padding: EdgeInsets.fromLTRB(20, 6, 10, 6), //color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              child: Text(
                                next.exercise,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              margin: EdgeInsets.only(bottom: 3),
                            ),
                            Text(
                              next.imageUrl.isEmpty ? "" : EXERCISEDUMMYDATA[0].imageUrl,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                              style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 0.20,
            child: ButtonRC("Exit workout", () {
              GlobalUtils.exitExercise(context);
            }, Colors.white70, Colors.red),
          )
        ],
      ),
    );
  }

  Timer _timer;
  int _start = 90;

  void startTimer() {
    if (_start == 90) {
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _playerController.dispose();
    super.dispose();
  }

  void setData() {
    setState(() {
      m = widget.data[selectedExercise];
      next = widget.data[selectedExercise + 1];
      if (m.imageUrl.isEmpty) startTimer();
    });
  }
}
