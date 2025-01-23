import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Aio {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static var theme = Theme.of(navigationKey.currentContext!);
  static SharedPreferences? pref;
  static Size size = Size(
      MediaQuery.of(navigationKey.currentContext!).size.width,
      MediaQuery.of(navigationKey.currentContext!).size.height);
  static initializePref() async {
    pref = await SharedPreferences.getInstance();
  }
}

extension DateTimeComparison on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
