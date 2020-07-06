import 'package:flutter/material.dart';

class LongList {
  final int id;
  final int exercise_detail_id;
  final String image;
  final String rep_time;
  final String name;
  final String gif_file;
  final String created_at;
  final String updated_at;

  Map<String,dynamic> toJson() => {
  "id":id,
  "exercise_detail_id":exercise_detail_id,
  "image":image,
  "rep_time":rep_time,
  "name":name,
  "gif_file":gif_file,
  "created_at":created_at,
  "updated_at":updated_at
  };

  LongList(
      {this.id,
      this.exercise_detail_id,
      this.image,
      this.rep_time,
      this.name,
      this.gif_file,
      this.created_at,
      this.updated_at});
}
