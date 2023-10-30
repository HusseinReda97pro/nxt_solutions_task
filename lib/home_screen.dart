import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/core/network/info_helper.dart';
import 'package:nxt_solutions_task/reservations/bloc/reservations_bloc.dart';
import 'package:nxt_solutions_task/reservations/data/models/UserTicket.dart';
import 'package:nxt_solutions_task/reservations/presentation/ReservationSheet.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:nxt_solutions_task/resources/theme/cubit/theme_cubit.dart';
import 'package:nxt_solutions_task/resources/theme/cubit/theme_state.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';
import 'package:nxt_solutions_task/widgets/theme_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ReservationsBloc>().add(
            LoadReservationsEvent(),
          );
    });
    super.initState();
  }

  void _openReservationSheet() {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.8,
      maxHeight: 1,
      context: context,
      builder: _buildBottomSheet,
      anchors: [0, 0.5, 1],
      isSafeArea: true,
    );
  }

  Widget _buildBottomSheet(
      BuildContext context, ScrollController controller, _) {
    return ReservationSheet(
      scrollController: controller,
    );
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

  Widget _buildIOSButton() {
    return InkWell(
      onTap: () {
        // const platform = MethodChannel('android');
        //
        // platform.invokeMethod("test");
      },
      child: Container(
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
      ),
    );
  }

  void _openAndroidSheet(
      {required ThemeState state,
      required ReservationsState reservationsState}) {
    if (reservationsState is LoadedReservationsState) {
      List<UserTicket> userTickets = reservationsState.reservation.userTickets;
      if (userTickets.isEmpty) {
        InfoHelper.showToast(message: "no tickets");
        return;
      }
      UserTicket userTicket = userTickets[0];
      const platform = MethodChannel('android');

      platform.invokeMethod("show_sheet", {
        "imageURL": userTicket.ticketUserData?.avatar ?? "",
        "name":
            "${userTicket.ticketUserData?.firstName ?? ""} ${userTicket.ticketUserData?.lastName ?? ""}",
        "number": userTicket.ticketId.toString(),
        "ticketTypeValue": userTicket.ticketTypeName,
        "seatValue": userTicket.seat,
        "theme": state is DarkThemeState ? "dark" : "light"
      });
    } else {
      InfoHelper.showToast(message: "no reservations");
    }
  }

  Widget _buildAndroidButton() {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<ReservationsBloc, ReservationsState>(
          builder: (context, reservationsState) {
            return InkWell(
              onTap: () => {
                _openAndroidSheet(
                    state: state, reservationsState: reservationsState)
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
                child: InkWell(
                  child: Text(
                    AppStrings.showAndroidTicket,
                    textAlign: TextAlign.center,
                    style:
                        Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                  ),
                ),
              ),
            );
          },
        );
      },
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
              _buildIOSButton(),
              _buildAndroidButton(),
            ],
          ),
        ),
      ),
    );
  }
}
