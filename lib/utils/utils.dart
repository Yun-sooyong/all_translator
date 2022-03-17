import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ANCHOR toast message
void showToast(String message) {
  Fluttertoast.showToast(
      toastLength: Toast.LENGTH_SHORT,
      msg: message,
      gravity: ToastGravity.BOTTOM);
}

// ANCHOR count list element
// https://coflutter.com/dart-count-the-occurrence-of-an-element-in-a-list/
int countOccurrencesUsingWhereMethod(List<dynamic> list, bool element) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  var foundElements = list.where((e) => e == element);
  return foundElements.length;
}

// ANCHOR double tap exit
//https://velog.io/@dino0806/%ED%86%A0%EC%8A%A4%ED%8A%B8%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EB%92%A4%EB%A1%9C-%EB%B2%84%ED%8A%BC-%EB%91%90%EB%B2%88-%EB%88%8C%EB%9F%AC%EC%95%BC-%EC%A2%85%EB%A3%8CFlutter-%EA%BF%80%ED%8C%81
DateTime? backPressTime;

onWillPop() {
  DateTime currentTime = DateTime.now();

  if (backPressTime == null ||
      currentTime.difference(backPressTime!) > const Duration(seconds: 2)) {
    backPressTime = currentTime;
    Fluttertoast.showToast(
        msg: '뒤로 버튼을 한번 더 누르시면 종료됩니다',
        gravity: ToastGravity.BOTTOM,
        backgroundColor: const Color(0xff6e6e6e),
        fontSize: 14,
        toastLength: Toast.LENGTH_SHORT);
    return false;
  }
  return true;
}
