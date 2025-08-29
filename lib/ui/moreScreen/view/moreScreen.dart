import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/apiCalling/saveUserData.dart';
import 'package:zohosystem/apiCalling/saveUserToken.dart';
import 'package:zohosystem/ui/landingScreen/view/landingScreen.dart';
import 'package:zohosystem/utils/colors.dart';

import '../../../utils/bottomBar.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../noMembershipScreens/view/termsofServicesScreen.dart';
import '../../noMembershipScreens/view/webviewScreen.dart';

class moreScreen extends StatefulWidget {
  const moreScreen({super.key});

  @override
  State<moreScreen> createState() => _moreScreenState();
}

class _moreScreenState extends State<moreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              width: Device.width,
              decoration: BoxDecoration(color: AppColors.alternativeBlueColor),
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
                      Icon(null)
                    ],
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
                  Center(
                    child: Text(
                      'My Messages',
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
                  Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () => Get.to(
                        WebviewScreen(
                          link:
                              "https://www.theadvicecentre.ltd/terms-and-conditions",
                        ),
                      ),
                      child: Text(
                        'Terms & Conditions',
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
                  Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.to(termsofServicesScreen(
                          fromPage: 'more',
                        ));
                      },
                      child: Text(
                        'Terms of Service',
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
                  Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () => Get.to(
                        WebviewScreen(
                          link: "https://amzbuddy.ai/",
                        ),
                      ),
                      child: Text(
                        'AMZBuddy - AI-Powered Amazon Assistant',
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
                  Divider(
                    thickness: 0.5,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text(
                                'Confirm Sign out',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              content: Text(
                                'Are you sure you want to sign out?',
                                style: TextStyle(fontSize: 17.sp),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text('No'),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text('Yes'),
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    SaveAuthtokenData.clearUserData();
                                    SaveDataLocal.clearUserData();
                                    Get.offAll(LandingScreen());
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Not ${userData?.data?[0].firstName}? Sign out here ...',
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppBottombar(),
      ),
    );
  }
}
