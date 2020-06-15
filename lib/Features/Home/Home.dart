import 'dart:async';
import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/Features/Home/HomePresenter.dart';
import 'package:bomb_bodies/Features/Home/HomeRowItems.dart';
import 'package:bomb_bodies/Features/Home/HomeView.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> implements HomeView {
  HomePresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = new HomePresenter();
    presenter.setV(this);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
              'Programs & Daily Workouts',
              style: TextStyle(fontWeight: FontWeight.bold, color:
              Colors.black),
            )),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                // use stack feature
                alignment: Alignment.topLeft,
                padding:
                EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 5),
                width: double.infinity,
                height: screenHeight * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/header.png',
                      ),
                      fit: BoxFit.fill),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Programs',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                            Theme.of(context).textTheme.caption.fontSize),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'At Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                            20,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Programs',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "   Daily Workouts",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
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
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (BuildContext ctx, int index) {
                      return HomeRowItems(index);
                    }),
              ),
            ],
          ),
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