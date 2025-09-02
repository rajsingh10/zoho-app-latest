import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/landingScreen/view/landingScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/webviewScreen.dart';
import 'package:zohosystem/utils/colors.dart';

import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/orangeBottomBar.dart';

class moreOreangeScreen extends StatefulWidget {
  const moreOreangeScreen({super.key});

  @override
  State<moreOreangeScreen> createState() => _moreOreangeScreenState();
}

class _moreOreangeScreenState extends State<moreOreangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
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
                  Image.asset(
                    Imgs.namedLogo,
                    scale: 5.5,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
            Container(
              height: Device.height,
              width: Device.width,
              color: AppColors.whiteColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () => Get.to(
                      WebviewScreen(
                        link:
                            "https://www.theadvicecentre.ltd/terms-and-conditions",
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Advice Centre Ltd Terms & Conditions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.regular,
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          fontSize: 16.sp,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () => Get.to(
                      WebviewScreen(
                        link:
                            "https://www.amzadvicecentre.com/terms-of-service",
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'AMZ Advice Centre: Terms of Service',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.regular,
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          fontSize: 16.sp,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () => Get.to(
                      WebviewScreen(
                        link:
                            "https://www.marketingadvicecentre.co.uk/terms-of-service",
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Marketing Advice Centre: Terms of Service',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.regular,
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          fontSize: 16.sp,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () => Get.to(
                      WebviewScreen(
                        link: "https://academy.theadvicecentre.ltd/",
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'The Advice Centre: Academy (Online Training)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.regular,
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          fontSize: 16.sp,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () => Get.to(
                      WebviewScreen(
                        link: "https://introducers.theadvicecentre.ltd/home",
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'The Advice Centre: Introducers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.regular,
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          fontSize: 16.sp,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () => Get.to(
                      WebviewScreen(
                        link: "https://www.amzbuddy.ai/",
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'AMZBuddy: AI Amazon Assistant',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.regular,
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          fontSize: 16.sp,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: Text(
                      'My Messages',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FontFamily.regular,
                        fontWeight: FontWeight.normal,
                        color: AppColors.blackColor,
                        fontSize: 16.sp,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.offAll(const LandingScreen());
                      },
                      child: Text(
                        'Existing Member? Sign In Here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.regular,
                          fontWeight: FontWeight.normal,
                          color: AppColors.orangeColor,
                          fontSize: 16.sp,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppOrangeBottombar(
          selected: 3,
        ),
      ),
    );
  }
}
