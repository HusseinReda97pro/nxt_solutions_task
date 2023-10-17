import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/gen/assets.gen.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';

class HotelLocation extends StatelessWidget {
  final String hotelName;
  final String address;
  const HotelLocation({
    Key? key,
    required this.hotelName,
    required this.address,
  }) : super(key: key);

  Widget _buildMap() {
    return Stack(
      children: [
        Assets.images.map.image(
          height: 110.h,
          width: 100.w,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.location,
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        10.heightBox,
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "$hotelName ${AppStrings.hotel}",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelSmall!
                            .copyWith(
                              color: Theme.of(context).indicatorColor,
                            ),
                      ),
                      12.heightBox,
                      AutoSizeText(
                        wrapWords: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        address,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelSmall!
                            .copyWith(
                              color: Theme.of(context).indicatorColor,
                              height: 1.4,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(flex: 2, child: _buildMap())
            ],
          ),
        ),
      ],
    );
  }
}
