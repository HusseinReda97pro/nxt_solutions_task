import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'models/app_colors.dart';

class AppTheme {
  final AppColors appColors;
  final TextTheme typography;
  SystemUiOverlayStyle? statusBar;
  AppTheme(
      {required this.appColors, required this.typography, this.statusBar}) {
    statusBar = const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ).copyWith(
      statusBarColor: appColors.background,
    );
  }

  ThemeData get theme => ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: appColors.primary,
          onPrimary: Colors.white,
          secondary: appColors.tertiary,
          onSecondary: Colors.white,
          error: appColors.red,
          onError: Colors.white,
          background: appColors.background,
          onBackground: appColors.textOnBackGround,
          surface: appColors.background,
          onSurface: appColors.textOnButton,
          tertiaryContainer: appColors.darkTertiary,
          outline: appColors.darkHint,
          surfaceVariant: appColors.lighterContainerColor,
        ),
        dividerTheme: DividerThemeData(
          color: appColors.borderColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: statusBar,
          iconTheme: IconThemeData(
            color: appColors.textOnBackGround,
          ),
        ),
        iconTheme: IconThemeData(
          color: appColors.textOnBackGround,
        ),
        scaffoldBackgroundColor: appColors.scaffoldBackgroundColor,
        cardColor: appColors.cardColor,
        cardTheme: CardTheme(color: appColors.cardColor),
        hintColor: appColors.hintColor,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: appColors.navBarColor,
        ),
        indicatorColor: appColors.indicatorColor,
        primaryTextTheme: TextTheme(
          displaySmall: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
          labelSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
          titleSmall: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
          titleLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
        ).apply(
          fontFamily: "SFDisplay",
          displayColor: appColors.textOnBackGround,
          bodyColor: appColors.textOnBackGround,
        ),
      );
}
