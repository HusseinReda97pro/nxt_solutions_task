import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/gen/assets.gen.dart';
import 'package:nxt_solutions_task/reservations/data/models/Reservation.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/hotel_location.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/hotel_name.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/hotel_rate.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/reservation_date.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/reservation_gallery.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/reservation_ticket.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/room_reservation.dart';
import 'package:nxt_solutions_task/reservations/presentation/widgets/sheet_header.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';
import 'package:nxt_solutions_task/widgets/dashed_line.dart';

import '../../resources/app_strings.dart';
import '../bloc/reservations_bloc.dart';
import '../data/models/UserTicket.dart';

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
    return Assets.images.sheetHeader.image(width: 1.sw, fit: BoxFit.fill);
  }

  Widget _buildTickets(List<UserTicket> userTickets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "${AppStrings.tickets}:",
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: userTickets.length,
            itemBuilder: (BuildContext context, int index) {
              return ReservationTicket(
                userTicket: userTickets[index],
              );
            })
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.amenities,
          style: Theme.of(context).primaryTextTheme.titleMedium,
        ),
        5.heightBox,
        Text(
          AppStrings.amenitiesMessage,
          style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                color: Theme.of(context).hintColor,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final verticalPadding = 40.heightBox;
    Reservation reservation = context.read<ReservationsBloc>().reservations[0];
    return Container(
      height: 0.85.sh,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
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
                ),
                verticalPadding,
                _buildTickets(reservation.userTickets),
                verticalPadding,
                DashedLine(
                  color: Theme.of(context).dividerColor,
                ),
                verticalPadding,
                RoomReservation(
                  room: reservation.stays[0].rooms[0],
                  roomNumber: 1,
                ),
                40.heightBox,
                ReservationGallery(imageURLs: reservation.stays[0].stayImages),
                40.heightBox,
                _buildFooter(),
                40.heightBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
