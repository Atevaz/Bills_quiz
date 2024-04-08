import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/core/manager/global_cubit/global_cubit.dart';
import 'package:quiz/core/styles/colors.dart';

class MyFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding ;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLine;
  final int? maxLength;
  final void Function()? onTap;
  final TextEditingController controller;
  final String validateText;
  final bool isPassword;
  final double borderRadius;
  final bool readOnly;
  final bool? autofocus;
  final TextInputType inputType;
  final String? hintText;
  final String? labelText;
  final TextAlign textAlign;
  final Function()? suffixPressed;
  final void Function(String)? onChanged;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onSubmit;
  final Color? borderColor;

  const MyFormField({
    Key? key,
    this.borderRadius = 8,
    required this.controller,
    required this.validateText,
    this.maxLine,
    this.maxLength,
    this.onTap,
    this.contentPadding,
    this.suffixPressed,
    this.isPassword = false,
    required this.inputType,
    this.hintText,
    this.autofocus,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.onSubmit,
    this.onTapOutside,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.labelText,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: TextFormField(
        autofocus: autofocus ?? false,
        onTapOutside: onTapOutside ?? (s){},
        onChanged: onChanged ?? (v) {},
        onFieldSubmitted: onSubmit ?? (v) {},
        readOnly: readOnly,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return validateText;
          }
          return null;
        },
        inputFormatters: maxLength==null ? null : [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        maxLines: maxLine ?? 1,

        obscureText: isPassword,
        keyboardType: inputType,
        textAlign: textAlign,
        decoration: InputDecoration(
          suffixIcon: suffix,
          prefixIcon: prefix,
          contentPadding:  contentPadding ?? EdgeInsets.fromLTRB(10.w, 20.h, 25.w, 20.h),
          hintText: hintText!,
          labelText: labelText,
          labelStyle:
              TextStyle(color: GlobalCubit.get(context).regularTextColor),
          hintStyle: TextStyle(
              color: GlobalCubit.get(context).regularTextColor,
              fontSize: 14.sp),
          border: borderColor != null
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius.r),
                  borderSide: GlobalCubit.get(context).isDark
                      ? BorderSide.none
                      : const BorderSide(
                          color: AppColor.primaryColor,
                        ),
                )
              : InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: GlobalCubit.get(context).isDark
                ? BorderSide.none
                : const BorderSide(
                    color: AppColor.primaryColor,
                  ),
          ),
          enabledBorder: borderColor != null
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: GlobalCubit.get(context).isDark
                ? BorderSide.none
                : const BorderSide(
              color: AppColor.primaryColor,
            ),
          )
              : OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide:BorderSide.none

          ),
          fillColor: AppColor.backgroundGreyColor,
          filled: true,
        ),
        style: TextStyle(
            color: AppColor.headlineTextColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        onTap: onTap ?? () {},
      ),
    );
  }
}
