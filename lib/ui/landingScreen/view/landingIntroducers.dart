import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zohosystem/ui/landingScreen/view/webviewIntroducers.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/noMembersHomeScreen.dart';
import 'package:zohosystem/utils/colors.dart';
import 'package:zohosystem/utils/images.dart';

import '../../../utils/fontFamily.dart';

class LandingIntroducers extends StatefulWidget {
  const LandingIntroducers({super.key});

  @override
  State<LandingIntroducers> createState() => _LandingIntroducersState();
}

class _LandingIntroducersState extends State<LandingIntroducers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SizedBox(
        height: Device.height,
        width: Device.width,
        child: Stack(
          children: [
            Positioned(
              top: 6.h,
              child: InkWell(
                onTap: () => Get.back(),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Image.asset(
                    Imgs.leftIcon,
                    scale: 5,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 7.h,
              right: -18.w,
              child: Image.asset(
                Imgs.onlyLogoIcon,
                scale: 1.2,
                color: AppColors.whiteColor,
              ),
            ),
            Positioned(
              top: 18.h,
              left: 3.w,
              child: Image.asset(
                Imgs.namedLogo,
                scale: 3.5,
                color: AppColors.whiteColor,
              ),
            ),
            Positioned(
                top: 55.h,
                left: -18.w,
                child: Transform.flip(
                  flipX: true,
                  child: Image.asset(
                    Imgs.onlyLogoIcon,
                    color: AppColors.whiteColor,
                    scale: 0.85,
                  ),
                )),
            Positioned(
              top: 82.h,
              right: 3.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAll(const Nomembershomescreen());
                        },
                        child: const Text(
                          'Looking for Expert Advice?',
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontFamily: FontFamily.regular),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(const Nomembershomescreen());
                    },
                    child: const Text(
                      'Return to the Dashboard here',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontFamily: FontFamily.regular),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 36.h,
              left: 3.w,
              child: SizedBox(
                height: 90.w,
                width: 87.w,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Text(
                    'Make Money, Save Money with The Advice Centre ',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.bold,
                      fontSize: 22.sp,
                      shadows: [
                        Shadow(
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 55.h,
              left: 2.w,
              child: InkWell(
                onTap: () => Get.to(
                  webViewIntroducers(
                    link: "https://introducers.theadvicecentre.ltd/home",
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 8.w),
                  width: 80.w,
                  height: 6.h,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color(0xff0097b2),
                        Color(0xff7ed957),
                      ]),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "I’m an Introducer",
                        style: TextStyle(
                            fontSize: 15.5.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.bold),
                      ),
                      Image.asset(
                        Imgs.rightIcon,
                        scale: 7,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 63.h,
              left: 2.w,
              child: InkWell(
                onTap: () async {
                  final Uri url =
                      Uri.parse("http://makemoneysavemoney-now.co.uk/");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode: LaunchMode
                          .externalApplication, // opens in Chrome or default browser
                    );
                  } else {
                    throw "Could not launch $url";
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 8.w),
                  width: 80.w,
                  height: 6.h,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color(0xffffde59),
                        Color(0xfff1811b),
                        Color(0xfff1811b),
                      ]),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discover How It All Works',
                        style: TextStyle(
                            fontSize: 15.5.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.bold),
                      ),
                      Image.asset(
                        Imgs.rightIcon,
                        scale: 7,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
