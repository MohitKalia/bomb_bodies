import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/Features/StartExercise/VideoScreen.dart';
import 'package:bomb_bodies/Features/SubExrciseList/SubExerciseListDummyData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void MyFormCallback(int result);

class SubListExerciseItem extends StatefulWidget {
  final height, width;
  final int index, selectedIndex;
  final MyFormCallback onSubmit;

  SubListExerciseItem(this.height, this.width, this.index, this.selectedIndex, this.onSubmit);

  @override
  SubListExerciseItemState createState() => SubListExerciseItemState();
}

class SubListExerciseItemState extends State<SubListExerciseItem> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GestureDetector(
        child: Container(
          margin: EdgeInsets.all( 7),
          padding: EdgeInsets.symmetric(vertical: 13),
          width: double.infinity,
          height: widget.height * 0.16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black.withOpacity(0.1), width: 3)),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.centerLeft,
                width: widget.width * 0.19,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(SUBEXERCISEListDUMMYDATA[widget.index].day),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: widget.selectedIndex == widget.index
                    ? Container(decoration: BoxDecoration(color: Colors.black54,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                )) : Container(),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: widget.width - 110,
                      padding: EdgeInsets.fromLTRB(30, 6, 10, 6),
                      //color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: Text(
                              SUBEXERCISEListDUMMYDATA[widget.index].exercise,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: widget.selectedIndex == widget.index
                                      ? FontWeight.w900
                                      : FontWeight.w600,
                                  color: widget.selectedIndex == widget.index
                                      ? primaryColors['blue']
                                      : primaryColors['bluelight']),
                            ),
                            margin: EdgeInsets.only(bottom: 3),
                          ),
                          Text(
                            SUBEXERCISEListDUMMYDATA[widget.index].imageUrl,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: widget.selectedIndex == widget.index
                                    ? FontWeight.w800
                                    : FontWeight.w400,
                                color: widget.selectedIndex == widget.index
                                    ? primaryColors['blue']
                                    : primaryColors['bluelight']),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () {
          List data = [];
          setState(() {
            widget.onSubmit(widget.index);
          });
          for (int i = 0; i < SUBEXERCISEListDUMMYDATA.length; i++) {
            if (i >= widget.index) {
              data.add(SUBEXERCISEListDUMMYDATA[i]);
              data.add(SubExerciseListDummyModel(
                  exercise: "90 seconds rest", day: "Up next", sets: "", imageUrl: ""));
            }
          }
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) => VideoScreen(data)));
        },
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text("Rest 90 seconds"),
      )
    ],);
  }
}
