import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubExerciseItem extends StatelessWidget {
  final height, width;
  int index;

  SubExerciseItem(this.height, this.width, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('10 Sets'),
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 3),
            padding: EdgeInsets.symmetric(vertical: 22),
            width: double.infinity,
            height: height * 0.18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(
                    color: Colors.lightBlueAccent.withOpacity(0.1),
                    width: 2.1)),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  width: width * 0.20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/splash.png'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100))),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            bottomLeft: Radius.circular(100))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: (width * 0.8) - 60,
                          padding:
                              EdgeInsets.only(left: 30, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                '10 reps',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.deepPurple),
                              ),
                              Text(
                                'Barbell.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
