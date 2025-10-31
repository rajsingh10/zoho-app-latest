import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/authentications/signup/view/registerScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/noMembersHomeScreen.dart';
import 'package:zohosystem/utils/colors.dart';
import 'package:zohosystem/utils/images.dart';

import '../../../utils/fontFamily.dart';
import '../../authentications/login/view/sendOtpScreen.dart';

class Sevendaystrialselectscreen extends StatefulWidget {
  const Sevendaystrialselectscreen({super.key});

  @override
  State<Sevendaystrialselectscreen> createState() =>
      _SevendaystrialselectscreenState();
}

class _SevendaystrialselectscreenState
    extends State<Sevendaystrialselectscreen> {
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
              top: 90.h,
              right: 3.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        Imgs.ukFlag,
                        scale: 32,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      const Text(
                        'Professional Advice',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontFamily: FontFamily.regular),
                      ),
                    ],
                  ),
                  const Text(
                    'from Leading UK Experts',
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontFamily: FontFamily.regular),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 32.h,
              left: 3.w,
              child: SizedBox(
                height: 90.w,
                width: 90.w,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Text(
                    'Get ready to transform you & your Business...',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.bold,
                      fontSize: 24.sp,
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
              top: 63.h,
              left: 2.w,
              child: InkWell(
                onTap: () => Get.to(
                  const Registerscreen(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 250),
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
                        'Start Your 7 Day Free Trial',
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
              top: 55.h,
              left: 2.w,
              child: InkWell(
                onTap: () => Get.to(
                  const Nomembershomescreen(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 250),
                ),
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
                        'Discover our Advice Centres',
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
              top: 72.h,
              right: 15.w,
              child: InkWell(
                onTap: () {
                  Get.to(const SendOtpScreen());
                },
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Past Member?',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.bold),
                    ),
                    Text(
                      'Sign here...',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontFamily: FontFamily.regular),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
