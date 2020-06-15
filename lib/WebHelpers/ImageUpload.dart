import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'ApiHelper.dart';

class ImageUpload {
  static Future<Map> updateProfileImage(String userId, File file) async {
    FormData formData = FormData.fromMap({
      "user_id": userId,
      "is_profile_pic": "0",
      "uploaded_file": await MultipartFile.fromFile(file.path,
          filename: DateTime.now().millisecondsSinceEpoch.toString() + ".png")
    });
    Dio dio = new Dio();
    var response = await dio.post(ApiHelper.uploadImage, data: formData);
    return jsonDecode(response.data.toString()) as Map;
  }
}
