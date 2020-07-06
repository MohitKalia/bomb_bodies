import 'dart:convert';
import 'package:dio/dio.dart';

class ApiHelper {
  static String baseUrl = "https://brainupca.com/bombbodies/public/api/";

  static String sWorkouts = "workoutlist";
  static String EXERCISE_LIST = 'exerciselist';
  static String INNER_EXERCISES = 'innerexerciselist';


  static Future<Map> getReq(String apiName) async {
    Dio dio = new Dio();
    Map workoutjson;
    Options options = Options(receiveTimeout: 5000);
    var response = await dio.get(baseUrl + apiName, options: options);
    workoutjson = jsonDecode(jsonEncode(response.data)) as Map;
    return workoutjson;
  }

  static Future<Map> fetchExerciseList(Map input, String apiName) async {
    Dio dio = new Dio();
    Options options = Options(receiveTimeout: 8000);
    var response = await dio.post(baseUrl + apiName, data: input,options: options);
    // Map data = json.decode(response.data);
    Map data = jsonDecode(jsonEncode(response.data)) as Map;
    return data;
  }

  static Future<Map> fetchInnerExercises(Map exerciseId,String apiName) async {
    Dio dio = Dio();
    Options options = Options(receiveTimeout: 8000);
    var response = await dio.post(baseUrl+apiName,data: exerciseId,options: options);
    Map data = jsonDecode(jsonEncode(response.data)) as Map;
    return data;
  }
}