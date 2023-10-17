import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';

class DarkTheme extends AppTheme {
  late SystemUiOverlayStyle drkStatusBar;
  DarkTheme({required super.appColors})
      : super(typography: Typography.whiteCupertino) {
    drkStatusBar = SystemUiOverlayStyle(
      statusBarIconBrightness:
          Platform.isIOS ? Brightness.dark : Brightness.light,
      statusBarBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
    ).copyWith(
      statusBarColor: appColors.scaffoldBackgroundColor,
    );
    super.statusBar = drkStatusBar;
  }

  @override
  ThemeData get theme => super.theme.copyWith();
}
