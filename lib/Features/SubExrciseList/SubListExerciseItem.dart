import 'package:bomb_bodies/BaseUtils/PrefHelper.dart';
import 'package:bomb_bodies/Features/StartExercise/VideoScreen.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubExerciseListDummyData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubListExerciseItem extends StatelessWidget {
  final height, width;
  int index, selectedIndex;

  SubListExerciseItem(this.height, this.width, this.index, this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(child: Container(
      margin: EdgeInsets.only(bottom: 7),
      padding: EdgeInsets.symmetric(vertical: 22),
      width: double.infinity,
      height: height * 0.18,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          color: selectedIndex == index ? Colors.grey : Colors.white12,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.lightBlueAccent.withOpacity(0.1), width: 2.1)),
      child: Row(children: <Widget>[
        Container(margin: EdgeInsets.only(right: 10),
          alignment: Alignment.centerLeft,
          width: width * 0.19,
          decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage(SUBEXERCISEListDUMMYDATA[index].day), fit: BoxFit.fill),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100), bottomRight: Radius.circular(100))),),
        Container(alignment: Alignment.centerLeft,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(width: width - 105,
                padding: EdgeInsets.fromLTRB(30, 6, 10, 6),
                //color: Colors.green,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Text(SUBEXERCISEListDUMMYDATA[index].exercise, style: TextStyle(
                          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),),
                      margin: EdgeInsets.only(bottom: 3),),
                    Text(SUBEXERCISEListDUMMYDATA[index].imageUrl, overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(fontSize: 13, color: Colors.black),)
                  ],),),
            ],),)
      ],),),

      padding: EdgeInsets.all(5), onPressed: () {
        List data = [];
        PrefHelper().setDeviceId(index);
        for (int i = 0; i < SUBEXERCISEListDUMMYDATA.length; i++) {
          if (i >= index) {
            for (int j = 0; j < 3; j++) {
              data.add(SUBEXERCISEListDUMMYDATA[i]);
              data.add(SubExerciseListDummyModel(
                  exercise: "90 seconds rest", day: "Up next", sets: "", imageUrl: ""));
            }
          }
        }
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) => VideoScreen(data)));
      },);
  }
}
