import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../noMembershipScreens/view/webviewScreen.dart';

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
            decoration:
                const BoxDecoration(color: AppColors.alternativeBlueColor),
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
                      InkWell(
                        onTap: () {
                        Get.to(
                          WebviewScreen(
                            link:
                            "https://forms.zohopublic.eu/theadvicecentreltd/form/Tideform/formperma/cJvInVC6B_gZoM3y5rHRmEXlKWMX-Gb0oq0VfIq_vXM",
                          ),
                        );
                      },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.appBlueColor,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Business Bank Account",
                                style: TextStyle(
                                  fontFamily: FontFamily.bold,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor,
                                  fontSize: 22.sp,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                "Tap here to Set up a Bank Account For Your Business",
                                style: TextStyle(
                                  fontFamily: FontFamily.regular,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.whiteColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  Imgs.partners1Img,
                                  scale: 2.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      InkWell(onTap: () {
                        Get.to(
                          WebviewScreen(
                            link:
                            "https://forms.zohopublic.eu/theadvicecentreltd/form/OGH/formperma/t96Sr1f6pbWACEAUGkHUnhm0DMLxutmQWM1KvMELujU",
                          ),
                        );
                      },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            Imgs.partners2Img,
                            scale: 2.5,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      InkWell(onTap: () {
                        Get.to(
                          WebviewScreen(
                            link:
                            "https://forms.zohopublic.eu/theadvicecentreltd/form/SJCForm/formperma/6l5VWGzdwrBtXakdCDWS_tBrBAIDzl15Ml8pLIQZzM4",
                          ),
                        );
                      },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 0.5.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color:
                                  AppColors.blackColor.withValues(alpha: 0.04)),
                          child: Column(
                            children: [
                              Text(
                                "Business Insurance",
                                style: TextStyle(
                                  fontFamily: FontFamily.bold,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor,
                                  fontSize: 22.sp,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                "Tap here to insure your Business",
                                style: TextStyle(
                                  fontFamily: FontFamily.regular,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.blackColor,
                                  fontSize: 16.sp,
                                ),
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
