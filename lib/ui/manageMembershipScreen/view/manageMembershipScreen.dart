import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/Loader.dart';
import 'package:zohosystem/ui/homeScreen/view/homeScreen.dart';
import 'package:zohosystem/ui/manageMembershipScreen/view/verifyPaymentsScripationScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/amzAdviceFindOutMore/amzAdviceFindOutMoreScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/amzAgencyFindOutMore/amzAgencyFindOutMoreScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/introducersFindOutMore/introducersFindOutMorePageScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/justAskAlexFindOutMore/justAskAlexFindOutMorePageScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/marketingAgencyFindOutMore/marketingAgencyFindOutMoreScreen.dart';

import '../../../apiCalling/apiConfig.dart';
import '../../../apiCalling/buildErrorDialog.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../apiCalling/saveUserToken.dart';
import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/snackBars.dart';
import '../../../utils/textFields.dart';
import '../../authentications/login/modal/authTokenModal.dart';
import '../../authentications/login/provider/loginProvider.dart';
import '../../authentications/signup/modal/allPlansModal.dart';
import '../../authentications/signup/modal/createSubscriptionModal.dart';
import '../../authentications/signup/provider/signupProvider.dart';
import '../../homeScreen/modal/subscriptionsDateModal.dart';
import '../../homeScreen/provider/homeProvider.dart';
import '../modal/resumeSubscriptionModal.dart';
import '../provider/membershipProvider.dart';
import 'membershipPageScreen.dart';

class manageMembershipScreen extends StatefulWidget {
  const manageMembershipScreen({super.key});

  @override
  State<manageMembershipScreen> createState() => _manageMembershipScreenState();
}

class _manageMembershipScreenState extends State<manageMembershipScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAuthtokenApi();
    getPlansApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Loader()
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColors.alternativeBlueColor),
                  child: Column(
                    children: [
                      SizedBox(height: 5.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Manage Membership ",
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
                          SizedBox(height: 2.h),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            width: Device.width,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 1.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0xffE9E7E7)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  subscriptionsdateleft
                                              ?.subscriptions?[0].status ==
                                          'cancelled'
                                      ? "No Membership Available"
                                      : "My Current Membership",
                                  style: TextStyle(
                                    fontFamily: FontFamily.extraBold,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.bgColor,
                                    decoration: TextDecoration.underline,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                subscriptionsdateleft
                                            ?.subscriptions?[0].status ==
                                        'cancelled'
                                    ? InkWell(
                                        onTap: () {
                                          _showStatefulBottomSheet(context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.5.h,
                                              horizontal: 12.w),
                                          decoration: BoxDecoration(
                                              color: AppColors.bgColor,
                                              borderRadius:
                                                  BorderRadius.circular(5.w)),
                                          child: Text(
                                            "Purchase Membership",
                                            style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.w100,
                                                fontFamily: FontFamily.bold,
                                                fontSize: 16.5.sp),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                subscriptionsdateleft
                                            ?.subscriptions?[0].status ==
                                        'cancelled'
                                    ? Container()
                                    : Text(
                                        subscriptionsdateleft?.subscriptions?[0]
                                                    .status ==
                                                'cancelled'
                                            ? "No Plan Available"
                                            : subscriptionsdateleft
                                                    ?.subscriptions?[0].name ??
                                                "",
                                        style: TextStyle(
                                          fontFamily: FontFamily.regular,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.blackColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                subscriptionsdateleft
                                            ?.subscriptions?[0].status ==
                                        'cancelled'
                                    ? Container()
                                    : SizedBox(
                                        height: 1.h,
                                      ),
                                subscriptionsdateleft
                                            ?.subscriptions?[0].status ==
                                        'cancelled'
                                    ? Container()
                                    : Text(
                                        subscriptionsdateleft?.subscriptions?[0]
                                                    .status ==
                                                'cancelled'
                                            ? "No Plan Available"
                                            : subscriptionsdateleft
                                                    ?.subscriptions?[0]
                                                    .planName ??
                                                "",
                                        style: TextStyle(
                                          fontFamily: FontFamily.extraBold,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.orangeColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                subscriptionsdateleft
                                            ?.subscriptions?[0].status ==
                                        'cancelled'
                                    ? Container()
                                    : SizedBox(
                                        height: 2.h,
                                      ),
                                subscriptionsdateleft
                                            ?.subscriptions?[0].status ==
                                        'cancelled'
                                    ? Container()
                                    : subscriptionsdateleft
                                                ?.subscriptions?[0].status ==
                                            'paused'
                                        ? Container()
                                        : InkWell(
                                            onTap: () => Get.to(
                                              const membershipPageScreen(),
                                              transition:
                                                  Transition.rightToLeft,
                                              duration: const Duration(
                                                  milliseconds: 250),
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w,
                                                  vertical: 1.h),
                                              decoration: BoxDecoration(
                                                  color: AppColors.bgColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.w)),
                                              child: Text(
                                                'Manage My Memberships',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: AppColors.whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        FontFamily.bold),
                                              ),
                                            ),
                                          ),
                                if (subscriptionsdateleft
                                        ?.subscriptions?[0].status ==
                                    'paused') ...[
                                  Text(
                                    "Your membership is currently paused. Click the button below to resume your membership.",
                                    style: TextStyle(
                                        color: AppColors.bgColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: FontFamily.regular,
                                        fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  if (subscriptionsdateleft
                                              ?.subscriptions?[0].resumeDate !=
                                          null &&
                                      subscriptionsdateleft
                                              ?.subscriptions?[0].resumeDate !=
                                          "") ...[
                                    Text(
                                      "Membership Resume is scheduled on ${subscriptionsdateleft?.subscriptions?[0].resumeDate}",
                                      style: TextStyle(
                                          color: AppColors.bgColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FontFamily.regular,
                                          fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                  ],
                                  (subscriptionsdateleft?.subscriptions?[0]
                                                  .resumeDate !=
                                              null &&
                                          subscriptionsdateleft
                                                  ?.subscriptions?[0]
                                                  .resumeDate !=
                                              "")
                                      ? InkWell(
                                          onTap: () {
                                            showResumeMembershipDialog(
                                                context, 'reschedule');
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.5.h,
                                                horizontal: 12.w),
                                            decoration: BoxDecoration(
                                                color: AppColors.bgColor,
                                                borderRadius:
                                                    BorderRadius.circular(5.w)),
                                            child: Text(
                                              "Reschedule Resume",
                                              style: TextStyle(
                                                  color: AppColors.whiteColor,
                                                  fontWeight: FontWeight.w100,
                                                  fontFamily: FontFamily.bold,
                                                  fontSize: 16.5.sp),
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            showResumeMembershipDialog(
                                                context, 'resume');
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.5.h,
                                                horizontal: 12.w),
                                            decoration: BoxDecoration(
                                                color: AppColors.bgColor,
                                                borderRadius:
                                                    BorderRadius.circular(5.w)),
                                            child: Text(
                                              "Resume Membership",
                                              style: TextStyle(
                                                  color: AppColors.whiteColor,
                                                  fontWeight: FontWeight.w100,
                                                  fontFamily: FontFamily.bold,
                                                  fontSize: 16.5.sp),
                                            ),
                                          ),
                                        ),
                                ],
                                SizedBox(
                                  height: 1.h,
                                ),
                                subscriptionsdateleft
                                            ?.subscriptions?[0].status ==
                                        'paused'
                                    ? Container()
                                    : Text(
                                        "*Please note we will need a 7 days cancellation notice*",
                                        style: TextStyle(
                                          fontFamily: FontFamily.light,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.blackColor,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                              width: Device.width,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 3.h),
                              color: AppColors.bgColor,
                              child: Column(
                                children: [
                                  Text(
                                    "Our Other Memberships:",
                                    style: TextStyle(
                                      fontFamily: FontFamily.extraBold,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.whiteColor,
                                      fontSize: 19.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.whiteColor),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Imgs.amz,
                                              scale: 4,
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
                                                    horizontal: 5.w,
                                                    vertical: 0.80.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: const Color(
                                                        0xfff2811b)),
                                                child: Text(
                                                  "Find Out More",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 13.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.whiteColor),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Imgs.theagency,
                                              scale: 2.2,
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
                                                    horizontal: 5.w,
                                                    vertical: 0.80.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: const Color(
                                                        0xff2070af)),
                                                child: Text(
                                                  "Find Out More",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 13.sp,
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
                                    height: 1.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 1.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.whiteColor),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          Imgs.amzagency,
                                          scale: 2.4,
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
                                                horizontal: 5.w, vertical: 1.h),
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
                                                fontSize: 13.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.whiteColor),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Imgs.justaskalex,
                                              scale: 5.5,
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
                                                    horizontal: 5.w,
                                                    vertical: 1.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: const Color(
                                                        0xff2070af)),
                                                child: Text(
                                                  "Find Out More",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 13.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.whiteColor),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Imgs.theadvicecl,
                                              scale: 5,
                                              // color: AppColors.yellowColor1,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                    const IntroducersFindOutMorePageScreen());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w,
                                                    vertical: 1.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: const Color(
                                                        0xff8ebcd9)),
                                                child: Text(
                                                  "Find Out More",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 13.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppBottombar(selected: 2),
      ),
    );
  }

  bool isLoading = true;
  SubscriptionsDateModal? subscriptionsdateleft;
  int daysRemaining = 0;

  subscriptionsViewApi() {
    checkInternet().then((internet) async {
      if (internet) {
        HomeProvider().subscriptionsViewApi().then((response) async {
          subscriptionsdateleft =
              SubscriptionsDateModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            setState(() {
              isLoading = false;
            });
            // showCustomSuccessSnackbar(
            //     title: 'Subscriptions', message: subscriptionsdateleft?.message ?? "");
            log("subscription date===>>>>${subscriptionsdateleft?.subscriptions?[0].lastBillingAt}");
            log("subscription date===>>>>${subscriptionsdateleft?.subscriptions?[0].nextBillingAt}");
            String? lastBillingAtStr =
                subscriptionsdateleft?.subscriptions?[0].lastBillingAt;
            String? nextBillingAtStr =
                subscriptionsdateleft?.subscriptions?[0].nextBillingAt;

            if (lastBillingAtStr != null && nextBillingAtStr != null) {
              DateTime nextBillingAt = DateTime.parse(nextBillingAtStr);

              setState(() {
                daysRemaining = nextBillingAt.difference(DateTime.now()).inDays;
              });

              log("Total Days: $daysRemaining");
            } else {
              log("No Date Available");
            }
          } else if (response.statusCode == 422) {
            setState(() {
              isLoading = false;
            });
          } else {
            // showCustomErrorSnackbar(
            //   title: 'Login Error',
            //   message: 'Internal Server Error',
            // );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, straceTrace) {
          final errorMessage = error.toString();
          dev.log("error=====>>>>$errorMessage  $straceTrace");

          if (errorMessage
              .contains("You are not authorized to perform this operation")) {
            dev.log("User not authorized, retaking token...");
            fetchAuthtokenApi();

            return;
          }

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
            subscriptionsViewApi();
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

  String? selectedMembership;

  List<Plans> plansList = [];

  getPlansApi() {
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider().fetchPlansApi().then((response) async {
          allPlans = AllPlansModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            print("data=====>>>>>>>");
            setState(() {
              plansList = allPlans?.plans ?? [];
              isLoading = false;
            });
          } else if (response.statusCode == 422) {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, stackTrace) {
          // showCustomErrorSnackbar(
          //   title: 'Login Error',
          //   message: error.toString(),
          // );
          log("error=====>>>>$stackTrace");
          setState(() {
            // isLoading = false;
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

  createSubscriptionApi() {
    setState(() {
      isLoading = true;
    });
    final Map<String, dynamic> data = {
      'customer_id': userData?.data?[0].customerId,
      'plan': {
        "plan_code": selectedMembership,
      },
      "starts_at": DateFormat('yyyy-MM-dd').format(DateTime.now()),
      "can_charge_setup_fee_immediately": true,
      "custom_fields": [
        {
          "label": "Start Date/Time",
          "value": DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())
        }
      ]
    };

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider().createSubscriptionApi(data).then((response) async {
          createSubscription =
              CreateSubscriptionModal.fromJson(json.decode(response.body));
          if (response.statusCode == 201) {
            setState(() {
              isLoading = false;
            });
            Get.to(
              VerifyPaymentScripationScreen(
                paymentLink: createSubscription?.hostedpage?.url ?? '',
              ),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 250),
            );
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Register Error", message: register?.message ?? '');
            setState(() {
              isLoading = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Create Subscription Error',
              message: register?.message ?? '',
            );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error) {
          // showCustomErrorSnackbar(
          //   title: 'Create Subscription Error',
          //   message: error.toString(),
          // );
          log("Error ========>>>>>>>>${error.toString()}");
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

  void _showStatefulBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(null),
                      Text(
                        "Purchase Membership",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontFamily: FontFamily.light,
                          color: AppColors.blackColor,
                          fontSize: 16.sp,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: AppColors.blueColor,
                          size: 17.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h),
                          Text(
                            "Membership Plan",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontFamily: FontFamily.light,
                              color: AppColors.blackColor,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          DropdownButtonFormField(
                            hint: Text(
                              "Select Membership Plan",
                              style: TextStyle(
                                color: AppColors.border,
                                fontFamily: FontFamily.regular,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                              ),
                            ),
                            icon: Icon(
                              CupertinoIcons.chevron_down,
                              size: 16.sp,
                              color: AppColors.border,
                            ).paddingOnly(right: 2.w),
                            value: selectedMembership,
                            items: plansList.map((item) {
                              return DropdownMenuItem(
                                value: item.planCode,
                                child: SizedBox(
                                  width: 55.w,
                                  child: Text(
                                    item.name ?? '',
                                    style: TextStyle(
                                      fontFamily: FontFamily.regular,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedMembership = value;
                              });
                              print("=====>>>>>>>>$selectedMembership");
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a Membership Plan';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              fillColor: AppColors.whiteColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.w),
                                borderSide: const BorderSide(
                                    width: 1.5, color: AppColors.border),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.w),
                                borderSide: const BorderSide(
                                    width: 1.5, color: AppColors.border),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.w),
                                borderSide: const BorderSide(
                                    width: 1.5, color: AppColors.blackColor),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.w),
                                borderSide: const BorderSide(
                                    width: 1.5, color: AppColors.redColor),
                              ),
                              errorStyle: TextStyle(
                                color: AppColors.redColor,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  selectedMembership == null
                      ? Container()
                      : InkWell(
                          onTap: () {
                            Get.back();
                            createSubscriptionApi();
                          },
                          child: Container(
                            width: Device.width,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: AppColors.blueColor),
                            child: Text(
                              "Purchase",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontFamily: FontFamily.bold,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  subscriptionResumeApi() {
    setState(() {
      isLoading = true;
    });
    final Map<String, dynamic> data = {
      "resume_at": selectedPauseOption == 1
          ? DateFormat('yyyy-MM-dd').format(DateTime.now())
          : _dateController.text.trim().toString(),
      "reason": _reasonController.text.trim().toString()
    };

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ManageMembershipProvider()
            .subscriptionsResumeApi(
                data, subscriptionsdateleft?.subscriptions?[0].subscriptionId)
            .then((response) async {
          resumeMembership =
              ResumeMembershipModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            setState(() {
              isLoading = false;
            });

            showCustomSuccessSnackbar(
              title: 'Membership Resumed',
              message: 'Your membership has been successfully resumed.',
            );
            Get.offAll(const Homescreen());
          } else if (response.statusCode == 422) {
            setState(() {
              isLoading = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Subscriptions Resume Error',
              message: 'Internal Server Error',
            );
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, straceTrace) {
          log("error=====>>>>${error.toString()}  $straceTrace");
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

  int selectedPauseOption = 1;
  final TextEditingController _reasonController = TextEditingController();
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void showResumeMembershipDialog(BuildContext context, from) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
              contentPadding: EdgeInsets.all(4.w),
              title: Center(
                child: Text(
                    from == 'reschedule'
                        ? 'Reschedule Resume'
                        : 'Resume Membership',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontFamily: FontFamily.bold,
                        fontWeight: FontWeight.bold)),
              ),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Currently Resume is scheduled on ${subscriptionsdateleft?.subscriptions?[0].resumeDate}',
                          style: TextStyle(
                              fontSize: 17.sp, fontFamily: FontFamily.bold)),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text('When do you want to resume this subscription?',
                          style: TextStyle(
                              fontSize: 17.sp, fontFamily: FontFamily.bold)),
                      RadioListTile<int>(
                        value: 1,
                        groupValue: selectedPauseOption,
                        title: Text('Immediately',
                            style: TextStyle(
                                fontSize: 16.sp, fontFamily: FontFamily.bold)),
                        subtitle: Text(
                            'This subscription will be resumed immediately.',
                            style: TextStyle(
                                fontSize: 15.sp, fontFamily: FontFamily.bold)),
                        onChanged: (value) {
                          setState(() {
                            selectedPauseOption = value!;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        value: 2,
                        groupValue: selectedPauseOption,
                        title: Text('On Specific Date',
                            style: TextStyle(
                                fontSize: 16.sp, fontFamily: FontFamily.bold)),
                        subtitle: Text(
                            'You can choose the date on which you want to resume this subscription.',
                            style: TextStyle(
                                fontSize: 15.sp, fontFamily: FontFamily.bold)),
                        onChanged: (value) {
                          setState(() {
                            selectedPauseOption = value!;
                          });
                        },
                      ),
                      if (selectedPauseOption == 2) ...[
                        SizedBox(height: 2.h),
                        AppTextField(
                          textInputType: TextInputType.datetime,
                          controller: _dateController,
                          hintText: 'dd/MM/yyyy',
                          text: 'Resume On',
                          isTextavailable: true,
                          readOnly: true,
                          validator: (value) {
                            if (selectedPauseOption == 2 &&
                                (value == null || value.isEmpty)) {
                              return 'Please select a date';
                            }
                            return null;
                          },
                          ontap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              setState(() {
                                selectedDate = picked;
                                _dateController.text =
                                    "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                              });
                            }
                          },
                        ),
                      ],
                      SizedBox(height: 2.h),
                      AppTextField(
                        controller: _reasonController,
                        hintText:
                            'Mention why are you resuming this subscription',
                        text: 'Reason',
                        isTextavailable: true,
                        textInputType: TextInputType.text,
                        maxline: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a reason';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.back();
                      subscriptionResumeApi();
                    }
                  },
                  child: const Text('Done'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
