import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/reservations/data/models/UserTicket.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';

import '../../../widgets/dashed_line.dart';

class ReservationTicket extends StatelessWidget {
  final UserTicket userTicket;
  const ReservationTicket({Key? key, required this.userTicket})
      : super(key: key);

  Widget _buildLine() {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 18.w,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r),
            ),
          ),
        ),
        const Expanded(child: DashedLine()),
        Container(
          width: 10.w,
          height: 18.w,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              15.widthBox,
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.w,
                      color: Theme.of(context).colorScheme.onPrimary,
                    )),
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: 34.w,
                    height: 34.w,
                    fit: BoxFit.cover,
                    imageUrl: userTicket.ticketUserData?.avatar ?? "",
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "${userTicket.ticketUserData?.firstName ?? ""} ${userTicket.ticketUserData?.lastName ?? ""}",
                        style: Theme.of(context).primaryTextTheme.titleMedium,
                      ),
                      Text(
                        "#${userTicket.ticketId}",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).indicatorColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _buildLine(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                16.heightBox,
                Row(
                  children: [
                    Text(
                      "${AppStrings.ticketType}: ",
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                    Text(
                      userTicket.ticketTypeName,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .displaySmall!
                          .copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                    ),
                  ],
                ),
                6.heightBox,
                Row(
                  children: [
                    Text("${AppStrings.seat}: ",
                        style: Theme.of(context).primaryTextTheme.titleMedium),
                    Text(
                      userTicket.seat,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .displaySmall!
                          .copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                    ),
                  ],
                ),
                10.heightBox,
              ],
            ),
          )
        ],
      ),
    );
  }
}
