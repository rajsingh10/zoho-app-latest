import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/apiCalling/saveUserData.dart';
import 'package:zohosystem/apiCalling/saveUserToken.dart';
import 'package:zohosystem/ui/landingScreen/view/landingScreen.dart';
import 'package:zohosystem/ui/moreScreen/view/myMessagesScreen.dart';
import 'package:zohosystem/utils/colors.dart';

import '../../../apiCalling/Loader.dart';
import '../../../apiCalling/buildErrorDialog.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../utils/bottomBar.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/snackBars.dart';
import '../../authentications/login/modal/authTokenModal.dart';
import '../../authentications/login/provider/loginProvider.dart';
import '../../homeScreen/provider/homeProvider.dart';
import '../../noMembershipScreens/view/termsofServicesScreen.dart';
import '../../noMembershipScreens/view/webviewScreen.dart';
import '../modal/marketingOptModal.dart';

class moreScreen extends StatefulWidget {
  const moreScreen({super.key});

  @override
  State<moreScreen> createState() => _moreScreenState();
}

class _moreScreenState extends State<moreScreen> {
  bool _marketingNotifications = false;
  bool isLoading = false;
  bool isChanging = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAuthtokenApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: isLoading
          ? Loader()
          : Stack(
              children: [
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 2.h),
                        width: Device.width,
                        decoration: const BoxDecoration(
                            color: AppColors.alternativeBlueColor),
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
                                const Icon(null)
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
                            InkWell(
                              onTap: () {
                                Get.to(const MyMessagesScreen());
                              },
                              child: Center(
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
                            const Divider(
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
                            const Divider(
                              thickness: 0.5,
                              color: AppColors.blackColor,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(null),
                                const Icon(null),
                                Text(
                                  'Marketing Notifications Opt In',
                                  style: TextStyle(
                                    fontFamily: FontFamily.regular,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.blackColor,
                                    fontSize: 16.sp,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                Switch.adaptive(
                                  value: _marketingNotifications,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _marketingNotifications = value;
                                    });
                                    marketOpt();
                                  },
                                  activeColor: AppColors.whiteColor,
                                  activeTrackColor: AppColors.bgColor,
                                  inactiveThumbColor: AppColors.whiteColor,
                                  inactiveTrackColor: Colors.grey.shade400,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ).paddingOnly(right: 3.w),
                              ],
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
                                            child: const Text('No'),
                                            onPressed: () {
                                              Get.back();
                                            },
                                          ),
                                          CupertinoDialogAction(
                                            isDestructiveAction: true,
                                            onPressed: () {
                                              SaveAuthtokenData.clearUserData();
                                              SaveDataLocal.clearUserData();
                                              Get.offAll(const LandingScreen());
                                            },
                                            child: const Text('Yes'),
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
                if (isChanging)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(child: Loader()),
                  ),
              ],
            ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppBottombar(),
      ),
    );
  }

  marketOpt() async {
    setState(() => isChanging = true);

    final Map<String, dynamic> data = {
      "customer_id": userData?.data?[0].customerId,
      "marketing_opt_in": _marketingNotifications ? '1' : '0',
    };

    log("Data: ${data.toString()}");

    try {
      final response = await HomeProvider().marketingOpt(data);

      marketingOpt = MarketingOptModal.fromJson(json.decode(response.body));

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() => isChanging = false);
        _marketingNotifications
            ? showCustomSuccessSnackbar(
                title: 'Marketing Notifications Enabled',
                message:
                    'You will now receive marketing notifications with the latest updates and offers.',
              )
            : showCustomSuccessSnackbar(
                title: 'Marketing Notifications Disabled',
                message: 'You will no longer receive marketing notifications.',
              );
      } else {
        showCustomErrorSnackbar(
          title: 'Fetch Notifications Error',
          message: response.body,
        );
      }
    } catch (e) {
      showCustomErrorSnackbar(
        title: 'Fetch Notifications Error',
        message: e.toString(),
      );
    } finally {
      setState(() => isChanging = false);
    }
  }

  fetchAuthtokenApi() {
    SaveAuthtokenData.removeAuthToken();
    checkInternet().then((internet) async {
      if (internet) {
        LoginProvider().refreshTokenApi().then((response) async {
          authtoken = AuthtokenModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            setState(() {
              // isLoading = false;
            });
            SaveAuthtokenData.saveAuthData(authtoken!);
            fetchMarketOpt();
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

  fetchMarketOpt() async {
    setState(() => isLoading = true);

    final Map<String, dynamic> data = {
      "customer_id": userData?.data?[0].customerId,
    };

    log("Data: ${data.toString()}");

    try {
      final response = await HomeProvider().fetchMarketingOpt(data);

      marketingOpt = MarketingOptModal.fromJson(json.decode(response.body));

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          _marketingNotifications = marketingOpt?.data?.marketingOptIn == 1;
          isLoading = false;
        });
      } else {
        showCustomErrorSnackbar(
          title: 'Fetch Marketing Opt Error',
          message: response.body,
        );
      }
    } catch (e) {
      showCustomErrorSnackbar(
        title: 'Fetch Marketing Opt Error',
        message: e.toString(),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }
}
