import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// toast message
void showToast(String message) {
  Fluttertoast.showToast(
      toastLength: Toast.LENGTH_SHORT,
      msg: message,
      gravity: ToastGravity.BOTTOM);
}

// count list element
// https://coflutter.com/dart-count-the-occurrence-of-an-element-in-a-list/
int countOccurrencesUsingWhereMethod(List<dynamic> list, bool element) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  var foundElements = list.where((e) => e == element);
  return foundElements.length;
}
