import 'package:flutter/material.dart';

extension StringExt on String {
  String last() {
    return substring(length - 1);
  }

  bool isLetter() {
    if ((codeUnitAt(0) > 64 && codeUnitAt(0) < 91) ||
        (codeUnitAt(0) > 96 && codeUnitAt(0) < 123)) {
      return true;
    }
    return false;
  }

  String dropLast() {
    return substring(0, length - 1);
  }

  int count(bool Function(String str) callback) {
    int check = 0;
    for (int i = 0; i < length; i++) {
      if (callback(this[i])) {
        check++;
      }
    }
    return check;
  }

  String take(int n) {
    return substring(0, n);
  }

  String takeLast(int n) {
    return substring(length - n);
  }

  String takeWhileContinue(bool Function(String str) callback) {
    String result = '';
    bool isStart = false;
    for (int i = 0; i < length; i++) {
      if (callback(this[i]) && !isStart) {
        result = result + this[i];
        isStart = true;
      } else if (callback(this[i]) && isStart) {
        result = result + this[i];
      } else if (!callback(this[i]) && !isStart) {
      } else {
        break;
      }
    }
    return result;
  }

  String takeWhile(bool Function(String ch) callback) {
    String str = '';
    for (int i = 0; i < length; i++) {
      if (callback(this[i])) {
        str += this[i];
      }
    }
    return str;
  }

  String takeLastWhile(bool Function(String ch) callback) {
    String str = '';
    for (int i = length-1; i >= 0; i--) {
      if (callback(this[i])) {
        str += this[i];
      }
    }
    return str;
  }
}
