import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';

class partnersScreen extends StatefulWidget {
  const partnersScreen({super.key});

  @override
  State<partnersScreen> createState() => _partnersScreenState();
}

class _partnersScreenState extends State<partnersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.alternativeBlueColor),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Text(
                  "Partners & Affiliates",
                  style: TextStyle(
                    fontFamily: FontFamily.bold,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                    fontSize: 19.sp,
                  ),
                ),
              ],
            ),
          ),

          // Scrollable white section
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.whiteColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 2.h),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.appBlueColor,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Tide - Business Bank Account",
                              style: TextStyle(
                                fontFamily: FontFamily.bold,
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor,
                                fontSize: 22.sp,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Image.asset(
                              Imgs.partners1Img,
                              scale: 2.5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Image.asset(
                        Imgs.partners2Img,
                        scale: 2.5,
                      ),
                      SizedBox(height: 1.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.whiteColor),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  Imgs.sjlLogo,
                                  scale: 3.5,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Tap here to insure your business",
                                  style: TextStyle(
                                    fontFamily: FontFamily.regular,
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
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppBottombar(),
      ),
    );
  }
}
