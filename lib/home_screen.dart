import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/reservations/presentation/ReservationSheet.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';
import 'package:nxt_solutions_task/widgets/theme_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openReservationSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          //the rounded corner is created here
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
        ),
        context: context,
        builder: (BuildContext context) => const ReservationSheet());
  }

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
        onPressed: _openReservationSheet,
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
      body: SafeArea(
        child: Padding(
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
      ),
    );
  }
}
