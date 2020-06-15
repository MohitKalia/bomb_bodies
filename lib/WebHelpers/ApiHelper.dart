import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class ApiHelper {
  static String baseUrl = "https://brainupca.com/bombbodies/public/api/";

  static String sWorkouts = "workoutlist";


  static Future<Map> getReq(String apiName) async {
    Dio dio = new Dio();
    Options options = Options(receiveTimeout: 5000);
    var response = await dio.get(baseUrl + apiName, options: options);
    Map data = json.decode(response.data);
    return data;
  }

  static Future<Map> postReq(Map input, String apiName) async {
    Dio dio = new Dio();
    var response = await dio.post(baseUrl + apiName, data: input);
    Map data = json.decode(response.data);
    return data;
  }
}
