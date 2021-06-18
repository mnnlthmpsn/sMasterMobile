import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//navigating to a new Screen
void newPage(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

// navigate to new screen and destroy previous
void newPageDestroyPrevious(context, screen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}

// dismiss keyboard
void dismissKeyboard(context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

// set in sharedPreferences
dynamic storeInLocalStorage(key, val, type) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  switch (type) {
    case 'int':
      {
        await prefs.setInt(key, val);
      }
      break;
    case 'str':
      {
        await prefs.setString(key, val);
      }
      break;
    case 'bool':
      {
        await prefs.setBool(key, val);
      }
      break;
  }
}

// type: CoolAlertType.success,
void showAlert(context, msg, type) {
  CoolAlert.show(
    context: context,
    type: type,
    text: msg,
    autoCloseDuration: Duration(seconds: 6),
  );
}

void showSnack(context, msg) {
  final snackBar = SnackBar(
    content: Text(
      msg.toString(),
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.grey,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
