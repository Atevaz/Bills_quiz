import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/icons/loader.json',
      fit: BoxFit.contain,
      animate: true,
      width: 120.w,
      frameRate: FrameRate.max,
      options: LottieOptions()
    );
  }
}
