import 'package:bomb_bodies/BaseClasses/Viewable.dart';

abstract class SubExerciseView extends Viewable{
  void onResponse(val);
  void onResponseError(msg);}