import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/gen/assets.gen.dart';
import 'package:nxt_solutions_task/reservations/data/models/Reservation.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/hotel_location.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/hotel_name.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/hotel_rate.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/reservation_date.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/sheet_header.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';

import '../bloc/reservations_bloc.dart';

class ReservationSheet extends StatefulWidget {
  const ReservationSheet({Key? key}) : super(key: key);

  @override
  State<ReservationSheet> createState() => _ReservationSheetState();
}

class _ReservationSheetState extends State<ReservationSheet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ReservationsBloc>().add(
            LoadReservationsEvent(),
          );
    });
    super.initState();
  }

  Widget _buildHeaderImage() {
    return Assets.images.sheetHeader.image();
  }

  @override
  Widget build(BuildContext context) {
    final verticalPadding = 40.heightBox;
    Reservation reservation = context.read<ReservationsBloc>().reservations[0];
    return Container(
      height: 0.85.sh,
      color: Theme.of(context).colorScheme.background,
      child: ListView(
        children: [
          const SheetHeader(),
          _buildHeaderImage(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
            child: Column(
              children: [
                HotelName(hotelName: reservation.stays[0].name),
                verticalPadding,
                ReservationDate(
                  startDate: reservation.startDate,
                  endDate: reservation.endDate,
                ),
                verticalPadding,
                HotelRate(
                  stars: reservation.stays[0].stars,
                  roomCount: reservation.stays[0].rooms.length,
                ),
                verticalPadding,
                HotelLocation(
                  hotelName: reservation.stays[0].name,
                  address: reservation.stays[0].address,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
