import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';

class ReservationDate extends StatelessWidget {
  final String startDate;
  final String endDate;
  const ReservationDate({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.from,
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
              10.heightBox,
              Text(
                dateFormat.format(DateTime.parse(startDate)),
                style:
                    Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.till,
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
              10.heightBox,
              Text(
                dateFormat.format(DateTime.parse(endDate)),
                style:
                    Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
