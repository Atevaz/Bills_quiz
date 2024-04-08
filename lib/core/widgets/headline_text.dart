import 'package:flutter/material.dart';
import 'package:quiz/core/manager/global_cubit/global_cubit.dart';

class HeadLineText extends StatelessWidget {
  final String text;
  final Color? color;
  final String? fontFamily;
  final double fontSize;
  final double? height;
  final int maxLines;
  final bool? isUpper;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow overflow;

  const HeadLineText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 18,
    this.maxLines = 1,
    this.fontFamily,
    this.overflow = TextOverflow.ellipsis,
    this.isUpper = true,
    this.fontWeight,
    this.textAlign,
    this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = GlobalCubit.get(context);
    return Text(
      isUpper! ? text.toUpperCase() : text,
      style: TextStyle(
        letterSpacing: 0,
          color: color ?? cubit.headLineTextColor,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize,
          height: height ?? 1,
          overflow: overflow,
      fontFamily:fontFamily??  'Bold'
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
