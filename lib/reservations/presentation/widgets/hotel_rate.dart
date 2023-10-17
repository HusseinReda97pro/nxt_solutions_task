import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';

class HotelRate extends StatelessWidget {
  final int stars;
  final int roomCount;
  const HotelRate({
    Key? key,
    required this.stars,
    required this.roomCount,
  }) : super(key: key);

  Widget _buildStars() {
    return RatingBarIndicator(
      rating: stars.toDouble(),
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Color(0xFFD4B363),
      ),
      itemCount: 5,
      itemSize: 18.sp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.stars,
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
              10.heightBox,
              _buildStars(),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.roomCount,
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
              10.heightBox,
              Text(
                "${roomCount.toString()} ${AppStrings.rooms}",
                style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
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
