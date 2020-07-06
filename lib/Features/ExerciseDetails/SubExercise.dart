import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/BaseUtils/GlobalUtils.dart';
import 'package:bomb_bodies/BaseUtils/PrefHelper.dart';
import 'package:bomb_bodies/Features/ExerciseDetails/SubExercisePresenter.dart';
import 'package:bomb_bodies/Features/ExerciseDetails/SubExerciseView.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubExerciseList.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubExerciseListDummyData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'SubExerciseDummyData.dart';
import 'SubExerciseItem.dart';

class SubExercise extends StatefulWidget {
  @override
  SubExerciseS createState() => SubExerciseS();
}

class SubExerciseS extends State<SubExercise> implements SubExerciseView {
  SubExercisePresenter presenter;
  bool load = false;
  var headerData = {};
  List _exerciseList = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    presenter = new SubExercisePresenter();
    presenter.setV(this);
  }

  @override
  void didChangeDependencies() {
    if (!load) {
      load = true;
      var id = ModalRoute.of(context).settings.arguments as String;
     // presenter.loadExercises(id);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColors['primaryLight'],
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: screenHeight * 0.40,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/header3.png'),
                          fit: BoxFit.fill),
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40))),
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
                                  headerData.isEmpty ? "Booty building": headerData['exercise_name'],
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
                                  headerData.isEmpty?"barbell, bench dumbells":headerData['equipments'],
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
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
                    //todo, static data
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => SubExerciseList()));

                    //todo, dynamic data
                    /*Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => SubExerciseList.dynamic(_exerciseList)));*/
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth > 400 ? 60 : 40,
                      vertical: screenWidth > 400 ? 10 : 5),
                  color: Theme.of(context).primaryColorDark,
                  child: Text(
                    'Start Workout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth > 400 ? 20 : 15),
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
                  style: TextStyle(
                      color: primaryColors['blue'] ,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Divider(
                    color: Theme.of(context).primaryColorDark,
                    height: 1.5,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // todo, unComment below for dynamic data
            child: /*showLoader? Center(child: CircularProgressIndicator()) : _exerciseList.length == 0 ? Center(child:Text('No Data available')) :*/ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: SUBEXERCISEDUMMYDATA.length,/*todo,  _exerciseList.length*/
                itemBuilder: (BuildContext ctx, int index) {
                  /* todo, for dynamic, -> var inners = _exerciseList[index]['exercises'][0];*/
                  return SubExerciseItem(screenHeight, screenWidth,index);
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
    _exerciseList.clear();
    headerData.clear();
    print('SubExercise___$val\n\n');
    PrefHelper().setEquipments(val['equipments']);
    setState(() {
      _exerciseList.addAll(val['inner_exercises'] as List);
      headerData.addAll(val);
    });

  }

  @override
  void onResponseError(val) {
    if(val.toString() == 'empty'){
      setState(() {
        _exerciseList.clear();
      });
    }else {
      GlobalUtils.errorMessage(val.toString());
    }
  }
}
