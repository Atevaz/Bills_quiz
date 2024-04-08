import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/core/styles/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: const Color(0xff3F34A5),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff2B1F8D).withOpacity(.10),
                  blurRadius: 5,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.normal,
                  offset: const Offset(0, 2),
                ),
              ]),
        ),
        Positioned(
          right: 2.w,
          left: 2.w,
          top: 1.5.h,
          child: Container(
            width: 58.5,
            height: 58.5.h,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29.25.r),
              color: const Color(0xff7264F6),
            ),
          ),
        ),
        Positioned(
          right: 2.w,
          left: 2.w,
          top: 3.5.h,
          child: Container(
            width: 56.5.w,
            height: 56.5.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.25.r),
                gradient: const LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFF5648C6), Color(0xFF3F32A4)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(.14),
                    blurRadius: 1,
                    spreadRadius: 0,
                    blurStyle: BlurStyle.normal,
                    offset: const Offset(0, 1),
                  ),
                ]),
            clipBehavior: Clip.antiAliasWithSaveLayer,

          ),
        ),
        Container(
          width: 60.w,
          height: 60.h,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Colors.transparent,
          ),
          child: Center(
              child: IconButton(onPressed: (){
                // Navigator.pushNamed(context, AppRouterNames.rAddAuction1Route);
              },icon: const Icon(Icons.add_rounded,color: AppColor.white,),)
          ),
        ),
      ],
    );
  }
}
