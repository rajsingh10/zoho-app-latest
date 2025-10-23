import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/authentications/signup/view/registerScreen.dart';
import 'package:zohosystem/ui/landingScreen/view/landingScreen.dart';
import 'package:zohosystem/ui/landingScreen/view/webViewAssociates.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/amzAdviceFindOutMore/amzAdviceFindOutMoreScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/marketingAgencyFindOutMore/marketingAgencyFindOutMoreScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/membershipFindOutMore/membershipFindOutMorePageScreen.dart';

import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/orangeBottomBar.dart';
import 'findOutMoreScreens/amzAgencyFindOutMore/amzAgencyFindOutMoreScreen.dart';
import 'findOutMoreScreens/justAskAlexFindOutMore/justAskAlexFindOutMorePageScreen.dart';

class joinTodayButtonPage extends StatefulWidget {
  const joinTodayButtonPage({super.key});

  @override
  State<joinTodayButtonPage> createState() => _joinTodayButtonPageState();
}

class _joinTodayButtonPageState extends State<joinTodayButtonPage> {
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
                    const Icon(null),
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Select a Service",
                      style: TextStyle(
                        fontFamily: FontFamily.extraBold,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      "to Get Started...",
                      style: TextStyle(
                        fontFamily: FontFamily.extraBold,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                        fontSize: 19.sp,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      width: Device.width,
                      color: const Color(0xff232f3f),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: AppColors.orangeColor),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.amzserviceagency,
                                      scale: 3.2,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const amzAdviceFindOutMoreScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.orangeColor),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: const Color(0xff22a34d)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.marketingadv,
                                      scale: 4.5,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const membershipFindOutMorePageScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xff22a34d)),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.8.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w, color: AppColors.perpl),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.aicenterphoto,
                                      scale: 6,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(webViewAssociates(
                                            link:
                                                "https://www.aiadvicecentre.com/lander"));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.perpl),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 2.3.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: const Color(0xff2274bb)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.alexmarkingphoto,
                                      scale: 4,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const JustAskAlexFindOutMorePageScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xff2274bb)),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.8.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: AppColors.orangeColor),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.amzzaagencycenter,
                                      scale: 2.5,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const amzAgencyFindOutMoreScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.orangeColor),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 2.3.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: const Color(0xff2274bb)),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.theagency,
                                      scale: 2,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(
                                            const marketingAgencyFindOutMorePageScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xff2274bb)),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.8.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: AppColors.blackColor),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.allinonevip,
                                      scale: 2,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(webViewAssociates(
                                            link:
                                                "https://www.theadvicecentre.ltd"));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.blackColor),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.8.w, vertical: 2.8.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: AppColors.bizvoard),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.bizboard,
                                      scale: 2.7,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(webViewAssociates(
                                            link:
                                                "https://www.bizboard.co.uk"));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.bizvoard),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.8.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w, color: AppColors.perpl),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.thedeveloperagency,
                                      scale: 2,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(webViewAssociates(
                                            link:
                                                "https://www.thedeveloperagency.co.uk"));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.perpl),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(webViewAssociates(
                                      link: "https://www.amzbuddy.ai/"));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 2.2.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5.w,
                                          color: AppColors.orangeColor),
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.whiteColor),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          Imgs.amzBuddy,
                                          scale: 4.5,
                                          // color: AppColors.yellowColor1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(webViewAssociates(
                                              link:
                                                  "https://www.amzbuddy.ai/"));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppColors.bgColor),
                                          child: Text(
                                            "Find Out More",
                                            style: TextStyle(
                                              fontFamily: FontFamily.bold,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.whiteColor,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Memberships To Transform You:',
                            style: TextStyle(
                              fontFamily: FontFamily.extraBold,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.8.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w, color: AppColors.intro),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.indures,
                                      scale: 1.5,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(webViewAssociates(
                                            link:
                                                "https://www.thedeveloperagency.co.uk"));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.intro),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.8.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: AppColors.orangeColor),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.whiteColor),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Imgs.univercity,
                                      scale: 1.8,
                                      // color: AppColors.yellowColor1,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(webViewAssociates(
                                            link:
                                                "https://www.universityofexperts.com"));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.orangeColor),
                                        child: Text(
                                          "Find Out More",
                                          style: TextStyle(
                                            fontFamily: FontFamily.bold,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(
                                const Registerscreen(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 250),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 1.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFfbd352), // yellowish start
                                    Color(0xFFf1811b), // orange end
                                    Color(0xFFf1811b), // orange end
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: Text(
                                'Start Free Trial',
                                style: TextStyle(
                                  fontFamily: FontFamily.extraBold,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 96.w,
                                child: Text(
                                  "Whichever service you select you are entitled up to 30 mins of Professional Advice or Support Time in your trial period. This will auto-renew unless you choose to cancel.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FontFamily.regular,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.whiteColor,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(const LandingScreen());
                            },
                            child: Text(
                              "Return to Login Screen",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: FontFamily.regular,
                                fontWeight: FontWeight.normal,
                                color: Colors.blue,
                                fontSize: 15.sp,
                              ),
                            ),
                          )
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
        child: AppOrangeBottombar(
          selected: 2,
        ),
      ),
    );
  }
}
