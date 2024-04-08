import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:quiz/core/styles/colors.dart';
import 'package:quiz/core/widgets/custom_loader.dart';
import 'package:quiz/core/widgets/default_text_form_field.dart';
import 'package:quiz/core/widgets/headline_text.dart';
import 'package:quiz/core/widgets/medium_text.dart';
import 'package:quiz/core/widgets/regular_text.dart';
import 'package:quiz/feature/auth/manager/auth_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return AuthCubit.get(context).bills == null ||
                    AuthCubit.get(context).bills!.isEmpty
                ? Center(
                    child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        )),
                  )
                : Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(16.r),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: MyFormField(
                              onChanged: (q) {
                                AuthCubit.get(context).filterBills(q: q);
                              },
                              controller: searchController,
                              validateText: '',
                              inputType: TextInputType.text,
                              hintText: 'Search',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                            ),
                          ),
                          Expanded(
                            child: AuthCubit.get(context)
                                .filteredBillsList
                                .isEmpty && searchController.text.isNotEmpty ? Center(child: MediumText(text: 'No Data Found',color: AppColor.primaryColor,),) : ListView.builder(
                              itemBuilder: (context, index) {
                                final adjustedIndex = index + 1;
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.h, horizontal: 8.w),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: AppColor.backgroundLightGreyColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                AppColor.black.withOpacity(.1),
                                            blurRadius: 3,
                                            spreadRadius: 0,
                                            offset: Offset(1, 4))
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.r),
                                      child: Column(
                                        children: [
                                          HeadLineText(
                                              text: 'Bill',
                                              color: AppColor.primaryColor),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Divider(
                                            color: AppColor.primaryColor
                                                .withOpacity(.5),
                                            indent: 100.w,
                                            endIndent: 100.w,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MediumText(
                                                text: 'SalesId',
                                                color: AppColor.primaryColor,
                                              ),
                                              RegularText(
                                                text: AuthCubit.get(context)
                                                        .filteredBillsList
                                                        .isNotEmpty
                                                    ? AuthCubit.get(context)
                                                                .filteredBillsList[
                                                            index]
                                                        ['SalesId']
                                                    : AuthCubit.get(context)
                                                                .bills![
                                                            adjustedIndex]
                                                        ['SalesId'],
                                                color: AppColor.primaryColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Divider(
                                            color: AppColor.primaryColor
                                                .withOpacity(.5),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MediumText(
                                                text: 'SalesStatus',
                                                color: AppColor.primaryColor,
                                              ),
                                              RegularText(
                                                text: AuthCubit.get(context)
                                                    .filteredBillsList
                                                    .isNotEmpty
                                                    ? AuthCubit.get(context)
                                                    .filteredBillsList[
                                                index]
                                                ['SalesStatus'].toString()
                                                    : AuthCubit.get(context)
                                                    .bills![adjustedIndex]
                                                        ['SalesStatus']
                                                    .toString(),
                                                color: AppColor.primaryColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Divider(
                                            color: AppColor.primaryColor
                                                .withOpacity(.5),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MediumText(
                                                text: 'CUSTACCOUNT',
                                                color: AppColor.primaryColor,
                                              ),
                                              RegularText(
                                                text: AuthCubit.get(context)
                                                    .filteredBillsList
                                                    .isNotEmpty
                                                    ? AuthCubit.get(context)
                                                    .filteredBillsList[
                                                index]
                                                ['CUSTACCOUNT']
                                                    : AuthCubit.get(context)
                                                    .bills![adjustedIndex]
                                                        ['CUSTACCOUNT']
                                                    .toString(),
                                                color: AppColor.primaryColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Divider(
                                            color: AppColor.primaryColor
                                                .withOpacity(.5),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MediumText(
                                                text: 'Customer',
                                                color: AppColor.primaryColor,
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Expanded(
                                                child: RegularText(
                                                  text: AuthCubit.get(context)
                                                      .filteredBillsList
                                                      .isNotEmpty
                                                      ? AuthCubit.get(context)
                                                      .filteredBillsList[
                                                  index]
                                                  ['Customer']
                                                      : AuthCubit.get(context)
                                                      .bills![adjustedIndex]
                                                          ['Customer']
                                                      .toString(),
                                                  color: AppColor.primaryColor,
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Divider(
                                            color: AppColor.primaryColor
                                                .withOpacity(.5),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MediumText(
                                                text: 'DELIVERYDATE',
                                                color: AppColor.primaryColor,
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    RegularText(
                                                      text: AuthCubit.get(context)
                                                          .filteredBillsList
                                                          .isNotEmpty
                                                          ? formatDate(AuthCubit.get(context)
                                                          .filteredBillsList[
                                                      index]
                                                      ['DELIVERYDATE']['date'])
                                                          : formatDate(AuthCubit
                                                                      .get(context)
                                                                  .bills![
                                                              adjustedIndex][
                                                          'DELIVERYDATE']['date']),
                                                      color:
                                                          AppColor.primaryColor,
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                    RegularText(
                                                      text: AuthCubit.get(context)
                                                          .filteredBillsList
                                                          .isNotEmpty
                                                          ? AuthCubit.get(context)
                                                          .filteredBillsList[
                                                      index]
                                                      ['DELIVERYDATE']
                                                      ['timezone_type']
                                                          .toString()
                                                          : AuthCubit.get(
                                                              context)
                                                          .bills![adjustedIndex]
                                                              ['DELIVERYDATE']
                                                              ['timezone_type']
                                                          .toString(),
                                                      color:
                                                          AppColor.primaryColor,
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                    RegularText(
                                                      text: AuthCubit.get(context)
                                                          .filteredBillsList
                                                          .isNotEmpty
                                                          ? AuthCubit.get(context)
                                                          .filteredBillsList[
                                                      index]
                                                      ['DELIVERYDATE']
                                                      ['timezone']
                                                          .toString()
                                                          : AuthCubit.get(context)
                                                                      .bills![
                                                                  adjustedIndex]
                                                              ['DELIVERYDATE']
                                                          ['timezone'],
                                                      color:
                                                          AppColor.primaryColor,
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: AuthCubit.get(context)
                                      .filteredBillsList
                                      .isNotEmpty || searchController.text.isNotEmpty
                                  ? AuthCubit.get(context)
                                      .filteredBillsList
                                      .length
                                  : AuthCubit.get(context).bills!.length - 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  String formatDate(String dateString) {
    // Parse the date string
    DateTime dateTime = DateTime.parse(dateString);

    dateTime.add(Duration(hours: 2));

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Check if the date is today
    if (dateTime.year == currentDate.year &&
        dateTime.month == currentDate.month &&
        dateTime.day == currentDate.day) {
      // If it's today, return the time format
      DateFormat timeFormatter = DateFormat(
        'hh:mm a',
      );
      return timeFormatter.format(dateTime);
    }

    // Check if the date is yesterday
    DateTime yesterdayDate = currentDate.subtract(Duration(days: 1));
    if (dateTime.year == yesterdayDate.year &&
        dateTime.month == yesterdayDate.month &&
        dateTime.day == yesterdayDate.day) {
      return 'Yesterday';
    }

    // For other dates, return the date format
    DateFormat dateFormatter = DateFormat(
      'MM/dd/yyyy',
    );
    return dateFormatter.format(dateTime);
  }
}
