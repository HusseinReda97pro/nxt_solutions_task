import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dark_theme.dart';
import '../light_theme.dart';
import '../models/dark_app_colors.dart';
import '../models/light_app_colors.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool get isDark {
    return state is DarkThemeState;
  }

  void getStartingMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? darkMode = prefs.getBool('dark mode');
    if (darkMode == null || darkMode == true) {
      changeToDarkMode();
    }
    if (darkMode != null && darkMode == false) {
      changeToLightMode();
    }
  }

  void changeToLightMode() async {
    emit(LightThemeState());
    SystemChrome.setSystemUIOverlayStyle(
        LightTheme(appColors: LightAppColors()).lightStatusBar);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark mode', false);
  }

  void changeToDarkMode() async {
    emit(DarkThemeState());
    SystemChrome.setSystemUIOverlayStyle(
        DarkTheme(appColors: DarkAppColors()).drkStatusBar);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark mode', true);
  }
}
