import 'package:flutter/material.dart';

import '../core/global/global.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode? theme;
  setTheme(ThemeMode val) {
    theme = val;
    notifyListeners();
  }

  bool isDarkTheme = false;
  setIsDarkTheme(bool val) {
    isDarkTheme = val;
    notifyListeners();
  }

  Future<void> initializeTheme() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (Aio.pref == null) {
        await Aio.initializePref();
      }
      var pref = Aio.pref!;
      bool getDarkTheme = pref.getBool('_isDarkTheme') ?? false;

      setTheme(getDarkTheme ? ThemeMode.dark : ThemeMode.light);
      setIsDarkTheme(getDarkTheme);
    });
  }
}
