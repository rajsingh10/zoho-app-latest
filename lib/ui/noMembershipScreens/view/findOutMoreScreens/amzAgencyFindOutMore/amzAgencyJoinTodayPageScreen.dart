import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/fontFamily.dart';
import '../../../../../utils/images.dart';

class amzAgencyJoinTodayPageScreen extends StatefulWidget {
  const amzAgencyJoinTodayPageScreen({super.key});

  @override
  State<amzAgencyJoinTodayPageScreen> createState() =>
      _amzAgencyJoinTodayPageScreenState();
}

class _amzAgencyJoinTodayPageScreenState
    extends State<amzAgencyJoinTodayPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            width: Device.width,
            decoration: const BoxDecoration(color: AppColors.orangeColor),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        Imgs.backIcon,
                        scale: 30,
                      ),
                    ),
                    Image.asset(
                      Imgs.namedLogo,
                      scale: 5.5,
                      color: AppColors.whiteColor,
                    ),
                    const Icon(null),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.whiteColor,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 1.h),
                        width: Device.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff232f3f)),
                        child: Row(
                          children: [
                            Image.asset(
                              Imgs.amzAgencyManPhoto,
                              scale: 1.5,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Join Today!",
                              style: TextStyle(
                                fontFamily: FontFamily.bold,
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor,
                                fontSize: 20.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 2.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffe9e7e7)),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Imgs.onlyLogoIcon,
                                      scale: 5.2,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "The Advice Centre Ltd",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.blackColor,
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                        Text(
                                          "Professional Advice...whenever you need it!",
                                          style: TextStyle(
                                            fontFamily: FontFamily.light,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.blackColor,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                alignment: Alignment.center,
                                color: AppColors.primary,
                                child: Text(
                                  "Here's your Membership Package...",
                                  style: TextStyle(
                                    fontFamily: FontFamily.bold,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.whiteColor,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 80.w,
                                      child: Text(
                                        "AMZ Agency: Professional Plan (3 Days a Month)",
                                        style: TextStyle(
                                          fontFamily: FontFamily.bold,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.blackColor,
                                          fontSize: 17.sp,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontFamily: FontFamily.regular,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.blackColor,
                                        fontSize: 17.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Price (1 * £2,500.00)",
                                      style: TextStyle(
                                        fontFamily: FontFamily.bold,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.blackColor,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    Text(
                                      "£2,500.00",
                                      style: TextStyle(
                                        fontFamily: FontFamily.regular,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.blackColor,
                                        fontSize: 17.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h),
                              const Divider(
                                  color: Color(0xfffe7eef5), thickness: 1),
                              SizedBox(height: 1.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subtotal",
                                      style: TextStyle(
                                        fontFamily: FontFamily.bold,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.blackColor,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    Text(
                                      "£2,500.00",
                                      style: TextStyle(
                                        fontFamily: FontFamily.regular,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.blackColor,
                                        fontSize: 17.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Standard Rate (20%)",
                                      style: TextStyle(
                                        fontFamily: FontFamily.bold,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.blackColor,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    Text(
                                      "£500.00",
                                      style: TextStyle(
                                        fontFamily: FontFamily.regular,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.blackColor,
                                        fontSize: 17.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h),
                              // Coupon Code Field
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Coupon Code",
                                          hintStyle: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: FontFamily.regular,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.5.h),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.5.h),
                                      decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          border: Border.all(
                                              color: AppColors.orangeColor),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        "Apply",
                                        style: TextStyle(
                                            color: AppColors.orangeColor,
                                            fontSize: 14.sp,
                                            fontFamily: FontFamily.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h),
                              const Divider(
                                  color: Color(0xfffe7eef5), thickness: 1),
                              SizedBox(height: 1.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                        fontFamily: FontFamily.bold,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.blackColor,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    Text(
                                      "£3,000.00",
                                      style: TextStyle(
                                        fontFamily: FontFamily.regular,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.blackColor,
                                        fontSize: 17.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 1.h,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: AppColors.orangeColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "CONTINUE TO PAYMENT INFO",
                                        style: TextStyle(
                                          fontFamily: FontFamily.bold,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.whiteColor,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_double_arrow_right,
                                        color: AppColors.whiteColor,
                                        size: 18.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
