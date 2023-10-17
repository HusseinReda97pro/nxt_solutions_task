import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenInit extends StatelessWidget {
  final Widget Function(BuildContext, Widget?) builder;
  final designWidth = 375.0;
  final designHeight = 812.0;

  const ScreenInit({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(designWidth, designHeight),
      useInheritedMediaQuery: true,
      //  minTextAdapt: true,
      // splitScreenMode: true,
      builder: builder,
    );
  }
}
