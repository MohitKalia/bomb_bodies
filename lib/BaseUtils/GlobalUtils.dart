import 'dart:async';

import 'package:bomb_bodies/BaseUtils/Colour.dart';
import 'package:bomb_bodies/Features/WorkoutCompleted/WorkoutCompleted.dart';
import 'package:bomb_bodies/Widgets/ButtonRC.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class GlobalUtils {
  BuildContext context;
  static var timeout = const Duration(seconds: 3);
  static var ms = const Duration(milliseconds: 1);

  GlobalUtils(BuildContext context) {
    this.context = context;
  }

  static String capitalize(String input) {
    if (input == null) {
      throw new ArgumentError("string: $input");
    }
    if (input.length == 0) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  // user defined function
  static void internetAlert(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("FitBloom"),
          content: new Text(""),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(""),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static exitExercise(context, name) {
    Dialog errorDialog = Dialog(
      backgroundColor: primaryColors['primary'],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: 370,
        width: MediaQuery.of(context).size.width - 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'End workout?',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 25),
              child: Text(
                'Are you sure you want to end your Workout?',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 170,
              child: ButtonRC("Complete workout", () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => WorkoutCompleted(name)));
              }, Colors.white, primaryColors['primary']),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 170,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: ButtonRC("Quit workout", () {
                for (int i = 0; i < 5; i++) {
                  Navigator.of(context).pop();
                }
              }, Colors.grey, Colors.white),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Dismiss',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => errorDialog);
  }

  // user defined function
  static void exitExercise1(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Exit workout"),
          content: new Text("Are you sure you want to exit workout?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future showDateDialog(BuildContext context, {res}) async {
    var today = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
        lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 14));
    if (picked != null && picked != today) {
      today = picked;
      res(today);
    }
  }

  static startTimeout(int milliseconds, Function callBack) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, callBack);
  }

  static String dd(now) {
    var formatter = new DateFormat('dd');
    return formatter.format(now); // something like 20
  }

  static String mmm(now) {
    var formatter = new DateFormat('MMM');
    return formatter.format(now); // something like Feb
  }

  static String mmmm(now) {
    var formatter = new DateFormat('MMMM');
    return formatter.format(now); // something like February
  }

  static String yyyy(now) {
    var formatter = new DateFormat('yyyy');
    return formatter.format(now); // something like 2013
  }

  static String ddMmmYyyy(now) {
    var formatter = new DateFormat('d-MM-yyyy');
    return formatter.format(now); // something like 20-04-2019
  }

  static String yyyymmdd(now) {
    var formatter = new DateFormat('yyyy-MM-dd');
    return formatter.format(now); // something like 20-04-2019
  }

  static String mMmmDdYyyy(now) {
    var formatter = new DateFormat('MMMM d, yyyy');
    return formatter.format(now); // something like March 04, 2019
  }

  static errorMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black54,
        textColor: Colors.white);
  }

  static bool emailValidation(String value, BuildContext context) {
    if (value.isEmpty) {
// The form is empty
      errorMessage("Please enter email address");
      return false;
    }
// This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
// So, the email is valid
      return true;
    }
    errorMessage("Please enter valid email");
// The pattern of the email didn't match the regex above.
    return false;
  }

  static bool passwordValidation(String value, BuildContext context) {
    bool isValidPassword = false;
    if (value.isEmpty) {
      errorMessage("Please enter password");
    } else if (value.length < 7) {
      errorMessage("Please enter valid password");
    } else {
      isValidPassword = true;
    }
    return isValidPassword;
  }

  static bool changePasswordValidation(String password, String rePassword, BuildContext context) {
    bool isValidPassword = false;
    if (passwordValidation(password, context)) {
      if (rePassword.isEmpty) {
        errorMessage("Please re-enter password");
      } else if (rePassword.length < 4) {
        errorMessage("Please enter valid password");
      } else if (!password.contains(rePassword)) {
        errorMessage("Password doesn't matched");
      } else {
        isValidPassword = true;
      }
    }
    return isValidPassword;
  }

  static bool firstNameLastNameValidation(String firstName, String lastName, BuildContext context) {
    bool isValidPassword = false;
    if (firstName.trim().isEmpty) {
      errorMessage("Please enter first name");
    } else if (lastName.trim().isEmpty) {
      errorMessage("Please enter last name");
    } else {
      isValidPassword = true;
    }
    return isValidPassword;
  }

  static bool allValidation(String firstName, String lastName, String phone, BuildContext context) {
    bool isValidPassword = false;
    if (firstNameLastNameValidation(firstName, lastName, context)) {
      if (phone.trim().isEmpty || phone.length < 7) {
        errorMessage("Please enter phone number");
      } else {
        isValidPassword = true;
      }
    }
    return isValidPassword;
  }

  static dayOfWeek(DateTime selectedDate) {
    var formatter = new DateFormat('EEEE');
    return formatter.format(selectedDate).toLowerCase(); // something like Monday, Tuesday
  }

  static timeFormat(var selectedTime) {
    var startTime = selectedTime.split("-")[0].replaceAll(":", "").split(" ")[0];
    var endTime = selectedTime.split("-")[1].replaceAll(":", "").split(" ")[0];
    if (selectedTime.split("-")[0].replaceAll(":", "").split(" ")[1] == "pm" &&
        startTime != "1200") {
      int intTime = int.tryParse(startTime);
      intTime = 1200 + intTime;
      startTime = intTime.toString();
    }
    if (selectedTime.split("-")[1].replaceAll(":", "").split(" ")[1] == "pm" && endTime != "1200") {
      int intTime = int.tryParse(endTime);
      intTime = 1200 + intTime;
      endTime = intTime.toString();
    }
    if (startTime.length == 3) startTime = "0" + startTime;
    if (endTime.length == 3) endTime = "0" + endTime;
    return startTime + "-" + endTime;
  }

  static getUtcDates(DateTime selectedDate) {
    return selectedDate.millisecondsSinceEpoch;
  }

  static languages(List languages) {
    String language = "";
    for (int i = 0; i < languages.length; i++) {
      language = language + capitalize(languages[i].trim()) + ", ";
    }
    return language.replaceRange(language.length - 2, language.length, "");
  }

  static bookingStatus(resp, bool isEnglish) {
    if (!isEnglish) {
      if ("processing" == resp) {
        resp = "wird bearbeitet";
      } else if ("publish" == resp) {
        resp = "veröffentlichen";
      }
    }
    return resp;
  }

  static gender(String resp, bool isEnglish) {
    if (!isEnglish) {
      if ("male" == resp) {
        resp = "männlich";
      } else {
        resp = "weiblich";
      }
    }
    return resp;
  }

  static String convertTime(String time) {
    String hour, minutes;
    String startTime, endTime;
    var list = time.split("-");
    if (list[0].length == 4) {
      hour = list[0].substring(0, 2);
      minutes = list[0].substring(2, 4);
    } else if (list[0].length == 3) {
      hour = list[0].substring(0, 1);
      minutes = list[0].substring(1, 3);
    }
    startTime = hour + ":" + minutes;
    if (list[1].length == 4) {
      hour = list[1].substring(0, 2);
      minutes = list[1].substring(2, 4);
    } else if (list[1].length == 3) {
      hour = list[1].substring(0, 1);
      minutes = list[1].substring(1, 3);
    }
    endTime = hour + ":" + minutes;
    return startTime + " - " + endTime;
  }

  static language(String resp, bool isEnglish) {
    if (!isEnglish) {
      if ("German" == resp) {
        resp = "Deutsch";
      } else {
        resp = "Englisch";
      }
    }
    return resp;
  }

  static translateMonths(String date, bool isEnglish) {
    var monthIs = date.split(" ")[0].trim();
    if (isEnglish) {
      return date;
    } else {
      var dateIs = "";
      if (monthIs == "January") {
        dateIs = date.replaceAll(monthIs, "Januar");
      } else if (monthIs == "February") {
        dateIs = date.replaceAll(monthIs, "Februar");
      } else if (monthIs == "March") {
        dateIs = date.replaceAll(monthIs, "März");
      } else if (monthIs == "April") {
        dateIs = date.replaceAll(monthIs, "April");
      } else if (monthIs == "May") {
        dateIs = date.replaceAll(monthIs, "Kann");
      } else if (monthIs == "June") {
        dateIs = date.replaceAll(monthIs, "Juni");
      } else if (monthIs == "July") {
        dateIs = date.replaceAll(monthIs, "Juli");
      } else if (monthIs == "August") {
        dateIs = date.replaceAll(monthIs, "August");
      } else if (monthIs == "September") {
        dateIs = date.replaceAll(monthIs, "September");
      } else if (monthIs == "October") {
        dateIs = date.replaceAll(monthIs, "Oktober");
      } else if (monthIs == "November") {
        dateIs = date.replaceAll(monthIs, "November");
      } else if (monthIs == "December") {
        dateIs = date.replaceAll(monthIs, "Dezember");
      }
      return dateIs;
    }
  }

  static convertExperience(String resp, bool isEnglish) {
    if (!isEnglish) {
      if ("0 months" == resp) {
        resp = "<1 Jahr";
      } else if (resp.split(" ")[0] != "0" && resp.split(" ")[1].trim() == "months") {
        resp = resp.split(" ")[0] + " Monate";
      } else {
        resp = ">" + resp.split(" ")[0] + " Jahr";
      }
    }
    return resp;
  }
}
