import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExerciseDummyData.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExerciseItem.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExercisePresenter.dart';
import 'package:bomb_bodies/Features/ExerciseList/ExerciseView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercise extends StatefulWidget {
  @override
  ExerciseState createState() => ExerciseState();
}

class ExerciseState extends State<Exercise> implements ExerciseView {
  ExercisePresenter presenter;
  List exercises = [];
  String workoutId;
  bool load = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    presenter = new ExercisePresenter();
    presenter.setV(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if(!load){
      load = true;
      workoutId = ModalRoute.of(context).settings.arguments as String;
      print('id is $workoutId');
     // presenter.getExpertList(workoutId);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColors['primaryLight'],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace,
            size: 20,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Legs & Glutes',
          style: TextStyle(fontWeight: FontWeight.bold, color: primaryColors['blue']
          ),
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
          SizedBox(height: 8,),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Legs & Glutes (${EXERCISEDUMMYDATA.length})",
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark ,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          Expanded(// todo, unComment below for dynamic data
            child: /*showLoader ? Center(child: CircularProgressIndicator(),) : exercises.length == 0? Center(child: Text('No Data Available')) : */ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                // todo, Dynamic and Static data 'item count'...
                itemCount: /*exercises.length*/EXERCISEDUMMYDATA.length,
                itemBuilder: (BuildContext ctx, int index) {
                  //var item = exercises[index]; todo , for dynamic only...
                  return ExerciseItem(screenHeight, screenWidth, index,/*item*/);
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

  @override
  void onResponse(val) {
    print('called...${(val as List).length}');
    exercises.clear();
    setState(() {
      exercises.addAll(val as List);
    });
//    print(val);
    // print('Part 2 Map is ,, ${val.toString()}');
  }
}
