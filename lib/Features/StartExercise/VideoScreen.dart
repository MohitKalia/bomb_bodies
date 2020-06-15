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

  @override
  void initState() {
    _playerController = VideoPlayerController.network(
        'https://brainupca.com/fitv1/public/storage/subserviceImages/image_gif20200611131454.m4v')
      ..initialize().then((value) {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _playerController.play();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 280,
            child: Stack(
              children: <Widget>[
                Center(
                  child: _playerController.value.initialized
                      ? AspectRatio(
                          aspectRatio: _playerController.value.aspectRatio,
                          child: VideoPlayer(_playerController),
                        )
                      : Container(),
                ),
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
            margin: EdgeInsets.only(bottom: 7),
            padding: EdgeInsets.symmetric(vertical: 22),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(
                    color: Colors.lightBlueAccent.withOpacity(0.1),
                    width: 2.1)),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/user2.png'),
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
                        width: MediaQuery.of(context).size.width - 97,
                        padding: EdgeInsets.fromLTRB(20, 6, 10, 6),
                        //color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
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
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[700]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
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
                    color: Colors.lightBlueAccent.withOpacity(0.1),
                    width: 2.1)),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/user2.png'),
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
                        width: MediaQuery.of(context).size.width - 97,
                        padding: EdgeInsets.fromLTRB(20, 6, 10, 6),
                        //color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
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
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[700]),
                            )
                          ],
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
