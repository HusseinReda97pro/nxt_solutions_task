import 'package:flutter/material.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';

class HotelName extends StatelessWidget {
  final String hotelName;
  const HotelName({Key? key, required this.hotelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.hotelCheckIn,
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        10.heightBox,
        Text(
          "$hotelName  ${AppStrings.hotel}",
          style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(
                color: Theme.of(context).hintColor,
              ),
        ),
      ],
    );
  }
}
