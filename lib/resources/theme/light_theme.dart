import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';

class LightTheme extends AppTheme {
  late SystemUiOverlayStyle lightStatusBar;

  LightTheme({required super.appColors})
      : super(typography: Typography.blackCupertino) {
    lightStatusBar = SystemUiOverlayStyle(
      statusBarIconBrightness:
          Platform.isIOS ? Brightness.light : Brightness.dark,
      statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
    ).copyWith(statusBarColor: appColors.background);

    super.statusBar = lightStatusBar;
  }

  @override
  ThemeData get theme => super.theme.copyWith(
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) => appColors.primary,
          ),
        ),
      );
}
