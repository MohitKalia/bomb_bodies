import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExerciseDummyData.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExerciseItem.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _playerController;

  // Future<void> _initializePlayerFuture;

  @override
  void initState() {
    _playerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((value) {
        setState(() {});
      });
//    _initializePlayerFuture = _playerController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.66,
            child: Stack(
              children: <Widget>[
                Image.asset("assets/images/workout.png"),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.keyboard_backspace,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "High Knees",
              style: TextStyle(
                  color: primaryColors['primary'],
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                child: Icon(
                  Icons.skip_previous,
                  size: 40,
                  color: primaryColors['primary'],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                child: Icon(
                  Icons.play_circle_outline,
                  size: 40,
                  color: primaryColors['primary'],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                child: Icon(
                  Icons.skip_next,
                  size: 40,
                  color: primaryColors['primary'],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 7),
            padding: EdgeInsets.symmetric(vertical: 22),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.18,
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
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/splash.png'),
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
                        width: MediaQuery.of(context).size.width - 137,
                        padding: EdgeInsets.fromLTRB(20, 6, 10, 6),
                        //color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.timer,
                                  size: 12,
                                ),
                                Text(
                                  EXERCISEDUMMYDATA[0].day,
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                )
                              ],
                            ),
                            Container(
                              child: Text(
                                EXERCISEDUMMYDATA[0].exercise,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              margin: EdgeInsets.only(bottom: 3),
                            ),
                            Text(
                              EXERCISEDUMMYDATA[0].imageUrl,
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }
}
