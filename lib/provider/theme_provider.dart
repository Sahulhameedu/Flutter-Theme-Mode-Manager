import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeType { Light, Dark, System }

class ThemeProvider extends ChangeNotifier {
  // late ThemeData _themeData; // No need to initialize here
  late ThemeModeType _currentThemeMode;
  late SharedPreferences _prefs;

  // ThemeData get themeData => _themeData;
  ThemeModeType get currentThemeMode => _currentThemeMode;

  ThemeProvider() {
    _currentThemeMode = ThemeModeType.System;
    // _themeData = ThemeData.light();
    _initTheme();
  }

  Future<void> _initTheme() async {
    _prefs = await SharedPreferences.getInstance();
    _currentThemeMode = ThemeModeType.values[_prefs.getInt('themeMode') ?? 0];
    // _updateThemeData();
  }

  // void _updateThemeData() {
  //   if (_currentThemeMode == ThemeModeType.System) {
  //     // ignore: deprecated_member_use
  //     final brightness = MediaQueryData.fromView(WidgetsBinding.instance.window)
  //         .platformBrightness;
  //     // _themeData =
  //     //     brightness == Brightness.light ? ThemeData.light() : ThemeData.dark();
  //   } else {
  //     // _themeData = _currentThemeMode == ThemeModeType.Light
  //     //     ? ThemeData.light()
  //     //     : ThemeData.dark();
  //   }
  // }

  Future<void> setThemeMode(ThemeModeType mode) async {
    _currentThemeMode = mode;
    // _updateThemeData();
    notifyListeners();
    await _prefs.setInt('themeMode', _currentThemeMode.index);
  }
}
