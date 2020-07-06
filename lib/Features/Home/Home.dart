import 'package:bomb_bodies/Features/Home/HomePresenter.dart';
import 'package:bomb_bodies/Features/Home/HomeRowItems.dart';
import 'package:bomb_bodies/Features/Home/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> implements HomeView {
  HomePresenter presenter;
  List workoutList = [];

  @override
  void initState() {
    super.initState();
    presenter = new HomePresenter();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    presenter.setV(this);
    presenter.loadData();
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
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/backImages/01.png',
                    ),
                    fit: BoxFit.fill),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Programs',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                Theme.of(context).textTheme.caption.fontSize),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 25),
                          Text('At Home',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:20,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Text('Programs',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                        ]),
                  ),
                  Image.asset('assets/backImages/03.png')
                ],
              ),
            ),
            SizedBox( height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( "   Daily Workouts",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(width: 5),
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
            SizedBox(height: 10),
            Expanded(
              child: showLoader ? Center(child: CircularProgressIndicator()) : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: workoutList.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    var item = workoutList[index];
                    int pointer = index;
                    if(index>=3){
                      if(index % 2 == 0){
                        pointer = 1;
                      }else if(index % 3 == 0){
                        pointer = 0;
                      }else{
                        pointer = 2;
                      }
                    }
                    return HomeRowItems(index,item,pointer);
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
  bool showLoader = true;

  @override
  onResponse(val) {
    workoutList.clear();
    setState(() {
      workoutList.addAll((val as List));
      showLoader = false;
    });

  }

  @override
  void dispose() {
    print('dispose called.....');
    super.dispose();
  }

}