import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class ApiHelper {
  static String baseUrl = baseUrl2 + "fitbloomapi/";
  static String baseUrl2 = "";
  static String username = 'ck_5be0c24650a0d1b5e53f8ec4a21f4671304751c7';
  static String password = 'cs_0f6d8c253a1f4741dac27ece5596ab1ba3756bc1';
  static String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

  static String sService = "services.php";
  static String sLogin = "login.php";
  static String sPaymentStripe = "stripe/testing.php";
  static String sSearchZip = "search_zipcodes.php";
  static String sAddReview = "add_review.php";
  static String sAddComment = "comment_expert.php";
  static String sViewReview = "view_review.php";
  static String sGetReview = "get_comments.php";
  static String sTimeSlot = "time_slot.php";
  static String sUpdateProfile = "update_profile.php";
  static String sDeviceId = "deviceid_change.php";
  static String sGetProfile = "dashboard_get_profile.php";
  static String sExpertInfo = "expert-info.php";
  static String sChangePassword = "change_password.php";
  static String sRegister = "register.php";
  static String sExpertList = "available_time.php";
  static String sFilterGender = "filter_gender.php";
  static String sServicePrice = "sidebar_services-price.php";
  static String sTImeSlots = "sidebar_availability.php";
  static String sForGotPassword = "forget_passwrd.php";
  static String sFaceBookLogin = "social-login.php";
  static String paypal = "paypal_test/paypal.php";
  static String uploadImage = baseUrl + "update_profile_pic.php";

  static Future<Map> bookExpert2(Map jsonMap) async {
    Dio dio = new Dio();
    Options options = Options(receiveTimeout: 5000, headers: {
      "authorization": basicAuth, // set content-length
    });
    var response =
        await dio.post(baseUrl2 + "wp-json/wc/v2/orders", data: jsonMap, options: options);
    Map data = json.decode(response.data);
    return data;
  }

  static Future<List> bookingList(String page) async {
    Dio dio = new Dio();
    Options options = Options(receiveTimeout: 5000, headers: {
      "authorization": basicAuth, // set content-length
    });
    var response = await dio.get(baseUrl2 + "wp-json/wc/v2/orders",
        queryParameters: {"page": page, "per_page": "100"}, options: options);
    return response.data as List;
  }

  static Future<Map> apis(Map input, String page) async {
    Dio dio = new Dio();
    var response = await dio.post(baseUrl + page, data: input);
    Map data = json.decode(response.data);
    return data;
  }
}
