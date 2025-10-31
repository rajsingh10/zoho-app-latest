import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/saveUserToken.dart';
import 'package:zohosystem/ui/authentications/login/modal/authTokenModal.dart';
import 'package:zohosystem/ui/authentications/login/view/sendOtpScreen.dart';
import 'package:zohosystem/ui/landingScreen/view/landingIntroducers.dart';
import 'package:zohosystem/ui/landingScreen/view/sevenDaysTrialSelectScreen.dart';
import 'package:zohosystem/utils/colors.dart';
import 'package:zohosystem/utils/images.dart';

import '../../../apiCalling/apiConfig.dart';
import '../../../apiCalling/buildErrorDialog.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/snackBars.dart';
import '../../authentications/login/provider/loginProvider.dart';
import 'landingAssociates.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchAuthtokenApi();
  }

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
                top: 52.h,
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
              top: 90.h,
              left: 12.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(const landingAssociates());
                        },
                        child: Text(
                          "Associates",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.bold,
                            fontSize: 16.5.sp,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.whiteColor,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const LandingIntroducers());
                    },
                    child: Text(
                      "Introducers",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamily.bold,
                        fontSize: 16.5.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.whiteColor,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 2,
                      ),
                    ),
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
              top: 55.h,
              left: 2.w,
              child: InkWell(
                onTap: () {
                  Get.to(
                    const SendOtpScreen(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 250),
                  );
                },
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
                        'I’m a Member',
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
                onTap: () => Get.to(
                  const Sevendaystrialselectscreen(),
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
                        'I’m Not a Member',
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
              right: 12.w,
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
                      'Sign in here...',
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

  fetchAuthtokenApi() {
    SaveAuthtokenData.removeAuthToken();
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().refreshTokenApi().then((response) async {
          authtoken = AuthtokenModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            setState(() {
              isLoading = false;
            });
            SaveAuthtokenData.clearUserData();
            SaveAuthtokenData.saveAuthData(authtoken!);
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Token Error", message: sendOtp?.message ?? '');
            setState(() {
              isLoading = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Token Error',
              message: 'Internal Server Error',
            );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error) {
          showCustomErrorSnackbar(
            title: 'Token Error',
            message: 'Internal Server Error',
          );
          setState(() {
            isLoading = false;
          });
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
