import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static final String sAddress = "address";
  static final String sCity = "city";
  static final String sUserId = "userId";
  static final String sRatings = "ratings";
  static final String sDeviceId = "deviceId";
  static final String sUserName = "userName";
  static final String sEmail = "email";
  static final String sGender = "gender";
  static final String sImage = "image";
  static final String sLanguage = "language";
  static final String sPhone = "phone";
  static final String sLastName = "lastName";
  static final String sFirstName = "firstName";
  static final String sServiceName = "serviceName";
  static final String sIsFacebook = "isFacebook";
  static final String sHouseNo = "sHouseNo";
  static final String sStreetName = "sStreetName";
  static final String EQUIPMENTS = 'EquipMEnts';

  void setEquipments(String equipments) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(EQUIPMENTS, equipments);
  }

  Future<String> getEquipments() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(EQUIPMENTS);
  }


  void setDeviceId(deviceId) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(sDeviceId, deviceId);
  }

  Future<int> getDeviceId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(sDeviceId);
  }


  void setRatings(String ratings) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sRatings, ratings);
  }

  Future<String> getRatings() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sRatings);
  }

  void setUserName(String userName) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sUserName, userName);
  }

  Future<String> getUserName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sUserName);
  }

  void setEmail(String email) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sEmail, email);
  }

  Future<String> getEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sEmail);
  }

  void setGender(String gender) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sGender, gender);
  }

  Future<String> getGender() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sGender);
  }

  void setProfileImage(String image) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sImage, image);
  }

  Future<String> getProfileImage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sImage);
  }


  void setLanguage(String language) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sLanguage, language);
  }

  Future<String> getLanguage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sLanguage);
  }

  void setPhone(String phone) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sPhone, phone);
  }

  Future<String> getPhone() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sPhone);
  }

  void setLastName(String lastName) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sLastName, lastName);
  }

  Future<String> getLastName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sLastName);
  }

  void setFirstName(String firstName) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
     pref.setString(sFirstName, firstName);
  }

  Future<String> getFirstName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sFirstName);
  }

  void setUserId(String userId) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sUserId, userId);
  }

  Future<String> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sUserId);
  }

  void setService(String serviceName) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sServiceName, serviceName);
  }

  Future<String> getService() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sServiceName);
  }

  void setAddress(String address) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sAddress, address);
  }

  Future<String> getAddress() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sAddress);
  }

  void setCity(String address) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sCity, address);
  }

  Future<String> getCity() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sCity);
  }

  void setStreetName(String sStreetName) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sStreetName, sStreetName);
  }

  Future<String> getStreetName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sStreetName);
  }

  void setHouseNo(String sHouseNo) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(sHouseNo, sHouseNo);
  }

  Future<String> getHouseNo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(sHouseNo);
  }

  void setFacebookUser(bool address) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(sIsFacebook, address);
  }

  Future<bool> isFacebook() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(sIsFacebook);
  }

  Future<String> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    //String deviceId = await getDeviceId();
    pref.clear();
    //setDeviceId(deviceId);
    return "";
  }

  Future saveUserData(val) async {
    if (val['id'] != null) setUserId(val['id']);
    setFirstName(val['first_name'] == null ? "" : val['first_name']);
    setLastName(val['last_name'] == null ? "" : val['last_name']);
    setGender(val['gender'] == null ? "" : val['gender']);
    setUserName(val['user_name'] == null ? "" : val['user_name']);
    setEmail(val['email'] == null ? "" : val['email']);
    setPhone(val['phone'] == null ? "" : val['phone']);
    setProfileImage(val['image'] == null ? "" : val['image']);
    setLanguage(val['languageType'] == null ? "" : val['languageType']);
  }

  Future saveUserDataNonBlank(val) async {
    if (val['id'] != null) setUserId(val['id']);
    if (val['first_name'] != null) setFirstName(val['first_name']);
    if (val['last_name'] != null) setLastName(val['last_name']);
    if (val['gender'] != null) setGender(val['gender']);
    if (val['user_name'] != null) setUserName(val['user_name']);
    if (val['email'] != null) setEmail(val['email']);
    if (val['phone'] != null) setPhone(val['phone']);
    if (val['image'] != null) setProfileImage(val['image']);
    if (val['languageType'] != null) setLanguage(val['languageType']);
  }
}
