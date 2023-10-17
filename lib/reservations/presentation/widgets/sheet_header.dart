import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      decoration: BoxDecoration(
          color: Theme.of(context).dividerTheme.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0.r),
            topLeft: Radius.circular(
              20.r,
            ),
          )),
      child: Row(
        children: [
          const Spacer(),
          Container(
            width: 60.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(
                20.r,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.more_horiz,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
