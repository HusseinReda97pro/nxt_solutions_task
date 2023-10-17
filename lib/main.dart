import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/home_screen.dart';
import 'package:nxt_solutions_task/resources/theme/cubit/theme_cubit.dart';
import 'package:nxt_solutions_task/resources/theme/dark_theme.dart';
import 'package:nxt_solutions_task/resources/theme/light_theme.dart';
import 'package:nxt_solutions_task/resources/theme/models/dark_app_colors.dart';
import 'package:nxt_solutions_task/resources/theme/models/light_app_colors.dart';

import 'resources/theme/cubit/theme_state.dart';
import 'widgets/bloc_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: BlocWidget(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            context.read<ThemeCubit>().getStartingMode();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
              title: 'NXT Solutions',
              themeMode: themeState is LightThemeState
                  ? ThemeMode.light
                  : ThemeMode.dark,
              theme: LightTheme(appColors: LightAppColors()).theme,
              darkTheme: DarkTheme(appColors: DarkAppColors()).theme,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: const Locale('en'),
              home: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
