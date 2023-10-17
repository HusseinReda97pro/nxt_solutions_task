import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/gen/assets.gen.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';

import '../resources/theme/cubit/theme_cubit.dart';
import '../resources/theme/cubit/theme_state.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({super.key});

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  Widget _buildTitle() {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, ThemeState themeState) => Row(
        children: [
          Assets.icons.themeIcon.image(
            width: 24.w,
            height: 24.w,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          10.widthBox,
          Text(
            AppStrings.theme,
            style: Theme.of(context).primaryTextTheme.titleMedium,
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, ThemeState themeState) => InkWell(
        onTap: () {
          if (themeState is DarkThemeState) {
            context.read<ThemeCubit>().changeToLightMode();
          } else {
            context.read<ThemeCubit>().changeToDarkMode();
          }
        },
        child: Container(
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.all(Radius.circular(25.r))),
          child: Row(
            children: [
              Image.asset(
                themeState is DarkThemeState
                    ? Assets.icons.lightOff2x.path
                    : Assets.icons.moon2x.path,
                width: 24.w,
                height: 24.w,
              ),
              14.widthBox,
              Image.asset(
                themeState is LightThemeState
                    ? Assets.icons.lightOn2x.path
                    : Assets.icons.sun2x.path,
                width: 24.w,
                height: 24.w,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTitle(),
        const Spacer(),
        _buildButton(),
      ],
    );
  }
}
