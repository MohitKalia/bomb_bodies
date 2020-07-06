import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/BaseUtils/PrefHelper.dart';
import 'package:bomb_bodies/Features/ExerciseDetails/SubExercisePresenter.dart';
import 'package:bomb_bodies/Features/ExerciseDetails/SubExerciseView.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubExerciseListDummyData.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubListExerciseItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'longList.dart';

class SubExerciseList extends StatefulWidget {
  List<LongList> _longList =[];
  List _exerciseList;

  // todo; dynamic only
  SubExerciseList();
  SubExerciseList.dynamic(this._exerciseList);

  @override
  SubExerciseListS createState() => SubExerciseListS();

}

class SubExerciseListS extends State<SubExerciseList> implements SubExerciseView {
  SubExercisePresenter presenter;
  int selectedIndex;

  @override
  void initState() {
    getSelectedIndex();
    super.initState();
//    setupList(widget._exerciseList);  todo,unComment for dynamic data.
    presenter = new SubExercisePresenter();
    presenter.setV(this);
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
          'Exercises',
          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                //todo, change dor Dynamic and static data respectively.
                itemCount: /*widget._longList.length*/SUBEXERCISEListDUMMYDATA.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return /*SubListExerciseItem(screenHeight, screenWidth,
                      index, selectedIndex,onSubmit, widget._longList[index],widget._longList.length);*/ SubListExerciseItem(screenHeight, screenWidth, index, selectedIndex, onSubmit);
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

  void getSelectedIndex() async {
    selectedIndex = await PrefHelper().getDeviceId();
    setState(() {
      build(context);
    });
  }

  void onSubmit(int result) {
    PrefHelper().setDeviceId(result);
    selectedIndex = result;
    setState(() {
      build(context);
    });
  }

  @override
  void onResponse(val) {
    // TODO: implement onResponse
  }

  @override
  void onResponseError(val) {
    // TODO: implement onResponseError
  }

  void setupList(List exerciseList) {
    for (int i = 0; i < exerciseList.length; i++) {
      String sets = exerciseList[i]['no_of_sets'];
      var data = exerciseList[i]['exercises'][0];
      var set = int.tryParse(sets);

      for (int j = 0; j < set; j++) {
        widget._longList.add(new LongList(
            id: data['id'],
            image: data['image'],
            name: data['name'],
            exercise_detail_id: data['exercise_detail_id'],
            gif_file: data['gif_file'],
            rep_time: data['rep_time']
        ));
      }
    }
  }

}
