import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/core/styles/colors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key? key,this.onTap,this.color,this.icon}) : super(key: key);

  final void Function()? onTap ;
  final Color? color ;
  final IconData? icon ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap ?? (){},
        child: Icon(icon??Icons.arrow_forward_rounded,color: color??AppColor.headlineTextColor,size: 25.sp,));
  }
}
