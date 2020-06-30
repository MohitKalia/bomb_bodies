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
    return RaisedButton(
      child: Container(
        margin: EdgeInsets.only(bottom: 7),
        padding: EdgeInsets.symmetric(vertical: 22),
        width: double.infinity,
        height: widget.height * 0.18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.selectedIndex == widget.index ? Colors.grey : Colors.white12,
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.lightBlueAccent.withOpacity(0.1), width: 2.1)),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerLeft,
              width: widget.width * 0.19,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(SUBEXERCISEListDUMMYDATA[widget.index].day),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100), bottomRight: Radius.circular(100))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: widget.width - 105,
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
                                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(bottom: 3),
                        ),
                        Text(
                          SUBEXERCISEListDUMMYDATA[widget.index].imageUrl,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                          style: TextStyle(fontSize: 13, color: Colors.black),
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
      padding: EdgeInsets.all(5),
      onPressed: () {
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
    );
  }
}
