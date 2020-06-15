import 'dart:async';
import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/Features/Home/Home.dart';
import 'package:bomb_bodies/Widgets/ButtonRC.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
       Navigator.of(context).pushReplacement(
           new MaterialPageRoute(builder: (BuildContext context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new InkWell(
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
                decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage("assets/images/splash.png"),
                fit: BoxFit.cover,
              ),
            )),
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                    child:  CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Container(
                          child: Image.asset("assets/images/logo.png"),
                        ),
                        radius: 110,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
