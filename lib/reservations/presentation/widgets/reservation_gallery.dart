import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nxt_solutions_task/resources/app_strings.dart';
import 'package:nxt_solutions_task/utilities/extensions/size_extension_box.dart';

class ReservationGallery extends StatelessWidget {
  final List<String> imageURLs;
  const ReservationGallery({Key? key, required this.imageURLs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.gallery,
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
        10.heightBox,
        SizedBox(
          height: 225.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageURLs.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(end: 6.w),
                  child: CachedNetworkImage(
                    imageUrl: imageURLs[index],
                    width: 150.w,
                    fit: BoxFit.cover,
                  ),
                );
              }),
        )
      ],
    );
  }
}
