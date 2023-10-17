import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/reservations/bloc/reservations_bloc.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';
import 'package:nxt_solutions_task/widgets/theme_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildFlutterButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      child: ElevatedButton(
        style: ButtonStyle(
          padding:
              MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15.h)),
          backgroundColor:
              MaterialStatePropertyAll(Theme.of(context).colorScheme.tertiary),
        ),
        onPressed: () {
          context.read<ReservationsBloc>().add(
                LoadReservationsEvent(),
              );
        },
        child: Text(
          AppStrings.openReservation,
          style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }

  Widget _buildAndroidButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.w,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 10.w,
      ),
      child: Text(
        AppStrings.showIOSTicket,
        textAlign: TextAlign.center,
        style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
      ),
    );
  }

  Widget _buildIOSButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
      child: InkWell(
        child: Text(
          AppStrings.showAndroidTicket,
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            40.heightBox,
            const ThemeSwitchWidget(),
            const Spacer(),
            _buildFlutterButton(),
            _buildAndroidButton(),
            _buildIOSButton()
          ],
        ),
      ),
    );
  }
}
