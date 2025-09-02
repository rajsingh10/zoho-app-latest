import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/fontFamily.dart';
import '../../../../../utils/images.dart';

class joinTodayPageScreen extends StatefulWidget {
  const joinTodayPageScreen({super.key});

  @override
  State<joinTodayPageScreen> createState() => _joinTodayPageScreenState();
}

class _joinTodayPageScreenState extends State<joinTodayPageScreen> {
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
                              Imgs.photo122344,
                              scale: 3,
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
                            horizontal: 5.w, vertical: 1.h),
                        width: Device.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffe9e7e7)),
                        child: Container(
                          width: Device.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.whiteColor),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 1.h),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          Imgs.onlyLogoIcon,
                                          scale: 5.5,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "The Advice Center Ltd",
                                              style: TextStyle(
                                                fontFamily: FontFamily.bold,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackColor,
                                                fontSize: 17.sp,
                                              ),
                                            ),
                                            Text(
                                              "Professional Advice...Whenever you need it!",
                                              style: TextStyle(
                                                fontFamily: FontFamily.light,
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.blackColor,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                alignment: Alignment.center,
                                color: const Color(0xff232f3f),
                                child: Text(
                                  "Here's Your Membership Package...",
                                  style: TextStyle(
                                    fontFamily: FontFamily.extraBold,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                width: Device.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xfff6f9fb)),
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 1.h),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.print,
                                      color: AppColors.orangeColor,
                                      size: 18.sp,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "YOUR PLAN DETAILS ARE HERE:",
                                      style: TextStyle(
                                        fontFamily: FontFamily.extraBold,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0XFF657482),
                                        fontSize: 17.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 1.h),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Start-up(Monthly)",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.blackColor,
                                            fontSize: 17.sp,
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
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Price (1 * £47.00)",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.blackColor,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        Text(
                                          "£47.00",
                                          style: TextStyle(
                                            fontFamily: FontFamily.regular,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.blackColor,
                                            fontSize: 17.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const Divider(
                                      color: Color(0xfffe7eef5),
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sub Total",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.blackColor,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        Text(
                                          "£47.00",
                                          style: TextStyle(
                                            fontFamily: FontFamily.regular,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.blackColor,
                                            fontSize: 17.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
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
                                          "£9.40",
                                          style: TextStyle(
                                            fontFamily: FontFamily.regular,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.blackColor,
                                            fontSize: 17.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    const Divider(
                                      color: Color(0xfffe7eef5),
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
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
                                          "£56.40",
                                          style: TextStyle(
                                            fontFamily: FontFamily.regular,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.blackColor,
                                            fontSize: 17.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          color: AppColors.orangeColor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              )
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
