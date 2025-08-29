import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/membershipFindOutMore/joinTodayPageScreen.dart';

import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/orangeBottomBar.dart';

class IntroducerFindOutScreen extends StatefulWidget {
  const IntroducerFindOutScreen({super.key});

  @override
  State<IntroducerFindOutScreen> createState() =>
      _IntroducerFindOutScreenState();
}

class _IntroducerFindOutScreenState extends State<IntroducerFindOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            width: Device.width,
            decoration: BoxDecoration(color: AppColors.orangeColor),
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
                    Icon(null),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              width: Device.width,
              color: AppColors.whiteColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(Imgs.introducer1Image),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Imgs.introducer2Image,
                          scale: 3,
                        ),
                        Column(
                          children: [
                            Text(
                              'How do I make money?',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.orangeColor,
                                  fontFamily: FontFamily.extraBold,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              width: 50.w,
                              child: Text(
                                'Simply INTRODUCE the AMZ Advice Centre or Marketing Advice Centre to Friends, Family Members, Business Owners or anyone who wants to start a Business and we\'ll pay you for every member you introduce that signs up!',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: FontFamily.regular,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 52.w,
                          child: Column(
                            children: [
                              Text(
                                'How much will I MAKE & SAVE?',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.orangeColor,
                                    fontFamily: FontFamily.extraBold,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                'Earn 10–15% commission for every customer you refer! Plus, get a 3% bonus on referrals made by your team.\n\nReach Level 3 with 50 introductions to our Advice Centres and unlock 12 months of VIP Membership — worth over £5,000!',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: FontFamily.regular,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          Imgs.introducer3Image,
                          scale: 3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 67.h,
                      width: Device.width,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffe9e7e7),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 1.h),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "No Contract!",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "from just £50+VAT a month",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.light,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    SizedBox(
                                      width: 90.w,
                                      child: Text(
                                        "Increase your monthly income for you & your family whilst growing your own Business!",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: FontFamily.regular),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                height: 20.h,
                                width: Device.width,
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                decoration:
                                    BoxDecoration(color: Color(0xff232f3f)),
                              ),
                            ],
                          ),
                          Positioned(
                              left: 8.w,
                              top: 15.h,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 1.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.whiteColor),
                                  child: Column(
                                    children: [
                                      Text(
                                        "THE ADVICE CENTER INTRODUCERS",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: FontFamily.regular),
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Text(
                                        "(LEVEL 3 - MONTHLY)",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: FontFamily.regular),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "£50",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.extraBold),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Build Monthly",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(joinTodayPageScreen());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.w, vertical: 1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xfffff800)),
                                          child: Text(
                                            "JOIN TODAY",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontFamily.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.check,
                                                color: AppColors.gray,
                                                size: 15.sp,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                "Monthly Membership:One Member",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: AppColors.blackColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily:
                                                        FontFamily.regular),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.check,
                                                color: AppColors.gray,
                                                size: 15.sp,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                "No Contract(just a 7 Day Cancellation\nNotice)",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: AppColors.blackColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily:
                                                        FontFamily.regular),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.check,
                                                color: AppColors.gray,
                                                size: 15.sp,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                "24/7 Access To Powerful 'On Demand'\nStrategic & Digital Marketing Training",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: AppColors.blackColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily:
                                                        FontFamily.regular),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.check,
                                                color: AppColors.gray,
                                                size: 15.sp,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                "Please note:For Personal 1-2-1 Advice &\nGuidance,please select either the 'Pro' or\n'PremiumPlan",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: AppColors.blackColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily:
                                                        FontFamily.regular),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppOrangeBottombar(),
      ),
    );
  }
}
