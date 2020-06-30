import 'package:bomb_bodies/BaseUtils/PrefHelper.dart';
import 'package:bomb_bodies/Features/ExerciseDetails/SubExercisePresenter.dart';
import 'package:bomb_bodies/Features/ExerciseDetails/SubExerciseView.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubExerciseListDummyData.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubListExerciseItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SubExerciseList extends StatefulWidget {
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
    presenter = new SubExercisePresenter();
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
          'Exercises',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
                itemCount: SUBEXERCISEListDUMMYDATA.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return SubListExerciseItem(screenHeight, screenWidth, index, selectedIndex, onSubmit);
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
}
