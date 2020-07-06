import 'package:bomb_bodies/Features/ExerciseList/Exercise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeRowItems extends StatelessWidget {
  final int index;
  final Map item;
  final int pointer;
  static const backgroundImages = [
    'assets/backImages/02.png',
    'assets/backImages/04.png',
    'assets/backImages/06.png'
  ];

  HomeRowItems(this.index, this.item, this.pointer);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {
        // todo, CHANGE THIS.
        {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (
                  BuildContext context,
                  ) =>
                  Exercise(),
              settings: RouteSettings(arguments: item['id'].toString())));
        }
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              backgroundImages[pointer],
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${item['name']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          fontSize: 25),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 1, 5, 0),
              child: Image.network(
                item['workout_image'],
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }
}
