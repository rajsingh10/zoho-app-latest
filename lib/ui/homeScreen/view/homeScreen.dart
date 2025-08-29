import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/Loader.dart';
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/ui/adviceTicketsScreen/view/adviceTicketsScreen.dart';
import 'package:zohosystem/ui/homeScreen/modal/getTimeEntryModal.dart';
import 'package:zohosystem/ui/homeScreen/modal/planDetailsModal.dart';
import 'package:zohosystem/ui/manageMembershipScreen/modal/resumeSubscriptionModal.dart';
import 'package:zohosystem/ui/manageMembershipScreen/view/membershipPageScreen.dart';
import 'package:zohosystem/ui/moreScreen/view/personalDetailsScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/amzAdviceFindOutMore/amzAdviceFindOutMoreScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/amzAgencyFindOutMore/amzAgencyFindOutMoreScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/findOutMoreScreens/marketingAgencyFindOutMore/marketingAgencyFindOutMoreScreen.dart';
import 'package:zohosystem/utils/bottomBar.dart';
import 'package:zohosystem/utils/colors.dart';

import '../../../apiCalling/buildErrorDialog.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../apiCalling/saveUserToken.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/snackBars.dart';
import '../../../utils/textFields.dart';
import '../../adviceTicketsScreen/view/createTicketScreen.dart';
import '../../authentications/login/modal/authTokenModal.dart';
import '../../authentications/login/provider/loginProvider.dart';
import '../../authentications/signup/modal/allPlansModal.dart' as Pllans;
import '../../authentications/signup/modal/createSubscriptionModal.dart';
import '../../authentications/signup/provider/signupProvider.dart';
import '../../manageMembershipScreen/provider/membershipProvider.dart';
import '../../manageMembershipScreen/view/manageMembershipScreen.dart';
import '../../manageMembershipScreen/view/verifyPaymentsScripationScreen.dart';
import '../../moreScreen/modal/getCustomerDataModal.dart';
import '../../noMembershipScreens/view/webviewScreen.dart';
import '../modal/allTicketModal.dart';
import '../modal/subscriptionsDateModal.dart';
import '../provider/homeProvider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKeyHome = GlobalKey<ScaffoldState>();
  int totalAdviceTime = 0;
  int totalSpentTime = 0;

  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      totalAdviceTime = 0;
      totalSpentTime = 0;
    });
    fetchContractApi(userData?.data?[0].customerId);
    subscriptionsViewApi();
    getPlansApi();
  }

  bool isTimeExceed = false;
  int selectedPauseOption = 1;

  void checkAndStoreTimeExceeded() async {
    final isExceeded = totalSpentTime >= totalAdviceTime;
    print('isExceeded : $isExceeded');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isTimeExceeded", isExceeded);
  }

  Future<bool> getTimeExceededStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isTimeExceeded") ?? false;
  }

  TextEditingController _reasonController = TextEditingController();
  DateTime? selectedDate;
  TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeyHome,
      backgroundColor: AppColors.bgColor,
      // drawer: SideMenu(),

      body: isLoading
          ? Loader()
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  width: Device.width,
                  decoration:
                      BoxDecoration(color: AppColors.alternativeBlueColor),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 3.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(PersonalDetailsScreen());
                            },
                            child: Image.asset(
                              Imgs.personIcon,
                              scale: 9.5,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome back!',
                                  style: TextStyle(
                                    fontFamily: FontFamily.extraBold,
                                    color: AppColors.whiteColor,
                                    fontSize: 20.sp,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                Text(
                                  "${getCustomer?.customer?.firstName ?? "N/A"} ${getCustomer?.customer?.lastName ?? ""}",
                                  style: TextStyle(
                                    fontFamily: FontFamily.bold,
                                    color: AppColors.whiteColor,
                                    fontSize: 18.sp,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: Device.width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(membershipPageScreen());
                                },
                                child: Container(
                                  width: Device.width,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.2.h, horizontal: 4.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.cardBgColor,
                                      borderRadius: BorderRadius.circular(5.w)),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Your Current Membership',
                                        style: TextStyle(
                                            color: AppColors.bgColor,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: FontFamily.extraBold,
                                            fontSize: 17.5.sp),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            subscriptionsdateleft
                                                        ?.subscriptions?[0]
                                                        .status ==
                                                    'cancelled'
                                                ? "No Membership Available"
                                                : subscriptionsdateleft
                                                        ?.subscriptions?[0]
                                                        .name ??
                                                    "N/A",
                                            style: TextStyle(
                                                color: AppColors.bgColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontFamily.light,
                                                fontSize: 15.sp),
                                          ),
                                          subscriptionsdateleft
                                                      ?.subscriptions?[0]
                                                      .status ==
                                                  'cancelled'
                                              ? Container()
                                              : Divider(
                                                  color: AppColors.bgColor,
                                                  thickness: 0.5,
                                                ),
                                          subscriptionsdateleft
                                                      ?.subscriptions?[0]
                                                      .status ==
                                                  'cancelled'
                                              ? Container()
                                              : Text(
                                                  subscriptionsdateleft
                                                              ?.subscriptions?[
                                                                  0]
                                                              .status ==
                                                          'cancelled'
                                                      ? "No Membership Available"
                                                      : subscriptionsdateleft
                                                              ?.subscriptions?[
                                                                  0]
                                                              .planName ??
                                                          "N/A",
                                                  style: TextStyle(
                                                      color: AppColors.bgColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          FontFamily.light,
                                                      fontSize: 15.sp),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              subscriptionsdateleft?.subscriptions?[0].status ==
                                      'cancelled'
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 92.w,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.2.h, horizontal: 4.w),
                                          decoration: BoxDecoration(
                                              color: AppColors.cardBgColor,
                                              borderRadius:
                                                  BorderRadius.circular(5.w)),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Purchase Membership",
                                                style: TextStyle(
                                                    color: AppColors.bgColor,
                                                    fontWeight: FontWeight.w100,
                                                    fontFamily:
                                                        FontFamily.extraBold,
                                                    fontSize: 18.5.sp),
                                              ),
                                              Divider(
                                                color: AppColors.bgColor,
                                                thickness: 0.5,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  _showStatefulBottomSheet(
                                                      context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.5.h,
                                                      horizontal: 12.w),
                                                  decoration: BoxDecoration(
                                                      color: AppColors.bgColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.w)),
                                                  child: Text(
                                                    "Click Here",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontFamily:
                                                            FontFamily.bold,
                                                        fontSize: 16.5.sp),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : subscriptionsdateleft
                                              ?.subscriptions?[0].status ==
                                          'paused'
                                      ? (subscriptionsdateleft
                                                      ?.subscriptions?[0]
                                                      .resumeDate !=
                                                  null &&
                                              subscriptionsdateleft
                                                      ?.subscriptions?[0]
                                                      .resumeDate !=
                                                  "")
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 92.w,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.2.h,
                                                      horizontal: 4.w),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.cardBgColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.w)),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Membership",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .bgColor,
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            fontFamily:
                                                                FontFamily
                                                                    .extraBold,
                                                            fontSize: 18.5.sp),
                                                      ),
                                                      Divider(
                                                        color:
                                                            AppColors.bgColor,
                                                        thickness: 0.5,
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        "Your membership is currently paused. Click the button below to resume your membership.",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .bgColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                FontFamily
                                                                    .regular,
                                                            fontSize: 16.sp),
                                                      ),
                                                      SizedBox(
                                                        height: 1.5.h,
                                                      ),
                                                      Text(
                                                        "Membership Resume is scheduled on ${subscriptionsdateleft?.subscriptions?[0].resumeDate}",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .bgColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                FontFamily
                                                                    .regular,
                                                            fontSize: 16.sp),
                                                      ),
                                                      SizedBox(
                                                        height: 1.5.h,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          showResumeMembershipDialog(
                                                              context,
                                                              'reschedule');
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      1.5.h,
                                                                  horizontal:
                                                                      12.w),
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .bgColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.w)),
                                                          child: Text(
                                                            "Reschedule Resume",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .whiteColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .bold,
                                                                fontSize:
                                                                    16.5.sp),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 92.w,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.2.h,
                                                      horizontal: 4.w),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.cardBgColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.w)),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Membership",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .bgColor,
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            fontFamily:
                                                                FontFamily
                                                                    .extraBold,
                                                            fontSize: 18.5.sp),
                                                      ),
                                                      Divider(
                                                        color:
                                                            AppColors.bgColor,
                                                        thickness: 0.5,
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        "Your membership is currently paused. Click the button below to resume your membership.",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .bgColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                FontFamily
                                                                    .regular,
                                                            fontSize: 16.sp),
                                                      ),
                                                      SizedBox(
                                                        height: 1.5.h,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          showResumeMembershipDialog(
                                                              context,
                                                              'resume');
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      1.5.h,
                                                                  horizontal:
                                                                      12.w),
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .bgColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.w)),
                                                          child: Text(
                                                            "Resume Membership",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .whiteColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .bold,
                                                                fontSize:
                                                                    16.5.sp),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.to(membershipPageScreen());
                                              },
                                              child: Container(
                                                width: Device.width * 0.47,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 1.2.h,
                                                    horizontal: 1.w),
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.cardBgColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.w)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Monthly Advice Time',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.bgColor,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontFamily: FontFamily
                                                              .extraBold,
                                                          fontSize: 18.5.sp),
                                                    ).paddingSymmetric(
                                                        horizontal: 3.w),
                                                    SizedBox(
                                                      height: 0.7.h,
                                                    ),
                                                    Text(
                                                      subscriptionsdateleft
                                                              ?.subscriptions?[
                                                                  0]
                                                              .planName ??
                                                          "N/A",
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.bgColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              FontFamily.light,
                                                          fontSize: 14.sp),
                                                    ),
                                                    SizedBox(
                                                      height: 0.7.h,
                                                    ),
                                                    Container(
                                                      height: 35.w,
                                                      width: 35.w,
                                                      padding:
                                                          EdgeInsets.all(11.sp),
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .whiteColor,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Stack(
                                                        children: [
                                                          SizedBox(
                                                            height: 35.w,
                                                            width: 35.w,
                                                            child:
                                                                CircularProgressIndicator(
                                                              value: (totalAdviceTime >
                                                                          0 &&
                                                                      totalSpentTime <=
                                                                          totalAdviceTime)
                                                                  ? totalSpentTime /
                                                                      totalAdviceTime
                                                                          .toDouble()
                                                                  : 1.0,
                                                              strokeWidth: 6,
                                                              color: AppColors
                                                                  .bgColor,
                                                            ),
                                                          ),
                                                          Center(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text(
                                                                  (totalAdviceTime - totalSpentTime).clamp(
                                                                              0,
                                                                              totalAdviceTime) <
                                                                          60
                                                                      ? "${(totalAdviceTime - totalSpentTime).clamp(0, totalAdviceTime)}"
                                                                      : "${((totalAdviceTime - totalSpentTime).clamp(0, totalAdviceTime) / 60).toStringAsFixed(0)}",
                                                                  style:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .bgColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        FontFamily
                                                                            .bold,
                                                                    fontSize:
                                                                        22.sp,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  (totalAdviceTime - totalSpentTime).clamp(
                                                                              0,
                                                                              totalAdviceTime) <
                                                                          60
                                                                      ? "secs"
                                                                      : "mins",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .bgColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .regular,
                                                                      fontSize:
                                                                          16.sp),
                                                                ),
                                                                Text(
                                                                  "Remaining",
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .bgColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .extraBold,
                                                                      fontSize:
                                                                          16.sp),
                                                                ),
                                                                SizedBox(
                                                                  height: 1.5.h,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (isTimeExceed)
                                                      InkWell(
                                                        onTap: () {
                                                          Get.to(
                                                              membershipPageScreen());
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 1.h,
                                                                  horizontal:
                                                                      3.5.w),
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .bgColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.w)),
                                                          child: Text(
                                                            "Upgrade Membership",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .whiteColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .bold,
                                                                fontSize:
                                                                    14.5.sp),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            subscriptionsdateleft
                                                            ?.subscriptions?[0]
                                                            .pauseDate ==
                                                        '' ||
                                                    subscriptionsdateleft
                                                            ?.subscriptions?[0]
                                                            .pauseDate ==
                                                        null
                                                ? InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                          membershipPageScreen());
                                                    },
                                                    child: Container(
                                                      width:
                                                          Device.width * 0.47,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.2.h,
                                                              horizontal: 1.w),
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .cardBgColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.w)),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Next Billing Date',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .bgColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .extraBold,
                                                                fontSize:
                                                                    18.5.sp),
                                                          ).paddingSymmetric(
                                                              horizontal: 3.w),
                                                          SizedBox(
                                                            height: 0.7.h,
                                                          ),
                                                          Text(
                                                            subscriptionsdateleft
                                                                        ?.subscriptions?[
                                                                            0]
                                                                        .status ==
                                                                    'cancelled'
                                                                ? "No Membership Available"
                                                                : subscriptionsdateleft
                                                                        ?.subscriptions?[
                                                                            0]
                                                                        .planName ??
                                                                    "N/A",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .bgColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .light,
                                                                fontSize:
                                                                    14.sp),
                                                          ),
                                                          SizedBox(
                                                            height: 0.7.h,
                                                          ),
                                                          Container(
                                                            height: 19.h,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Text(
                                                                  subscriptionsdateleft
                                                                              ?.subscriptions?[0]
                                                                              .status ==
                                                                          'cancelled'
                                                                      ? "N/A"
                                                                      : '${daysRemaining}',
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .orangeColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .bold,
                                                                      fontSize:
                                                                          30.sp),
                                                                ),
                                                                Text(
                                                                  'days left',
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .orangeColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .light,
                                                                      fontSize:
                                                                          16.sp),
                                                                ),
                                                                Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  subscriptionsdateleft
                                                                              ?.subscriptions?[0]
                                                                              .status ==
                                                                          'cancelled'
                                                                      ? "Monthly renewal date:N/A"
                                                                      : 'Monthly renewal date:${dayWithSuffix}',
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .bgColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .light,
                                                                      fontSize:
                                                                          14.5.sp),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    width: Device.width * 0.47,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.2.h,
                                                            horizontal: 1.w),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .cardBgColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.w)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Plan is pausing',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .bgColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100,
                                                              fontFamily:
                                                                  FontFamily
                                                                      .extraBold,
                                                              fontSize:
                                                                  18.5.sp),
                                                        ).paddingSymmetric(
                                                            horizontal: 3.w),
                                                        SizedBox(
                                                          height: 0.7.h,
                                                        ),
                                                        Text(
                                                          subscriptionsdateleft
                                                                      ?.subscriptions?[
                                                                          0]
                                                                      .status ==
                                                                  'cancelled'
                                                              ? "No Membership Available"
                                                              : subscriptionsdateleft
                                                                      ?.subscriptions?[
                                                                          0]
                                                                      .planName ??
                                                                  "N/A",
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .bgColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  FontFamily
                                                                      .light,
                                                              fontSize: 14.sp),
                                                        ),
                                                        SizedBox(
                                                          height: 0.7.h,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              subscriptionsdateleft
                                                                          ?.subscriptions?[
                                                                              0]
                                                                          .pauseDate ==
                                                                      ''
                                                                  ? "N/A"
                                                                  : DateTime.parse(
                                                                          subscriptionsdateleft?.subscriptions?[0].pauseDate ??
                                                                              '')
                                                                      .difference(DateTime.parse(DateFormat(
                                                                              'yyyy-MM-dd')
                                                                          .format(
                                                                              DateTime.now())))
                                                                      .inDays
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .orangeColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .bold,
                                                                  fontSize:
                                                                      30.sp),
                                                            ),
                                                            Text(
                                                              'days left',
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .orangeColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .light,
                                                                  fontSize:
                                                                      16.sp),
                                                            ),
                                                            Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              'Pause date: ${subscriptionsdateleft?.subscriptions?[0].pauseDate ?? ''}',
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .bgColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .light,
                                                                  fontSize:
                                                                      14.5.sp),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 1.h,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.to(
                                                                membershipPageScreen());
                                                            print(subscriptionsdateleft
                                                                ?.subscriptions?[
                                                                    0]
                                                                .pauseDate);
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        1.5.h,
                                                                    horizontal:
                                                                        4.w),
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .bgColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.w)),
                                                            child: Text(
                                                              "Manage Membership",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .bold,
                                                                  fontSize:
                                                                      15.sp),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 0.7.h,
                                                        ),
                                                        Center(
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                height: 3.5.w,
                                                                width: 3.5.w,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: AppColors
                                                                        .bgColor),
                                                              ),
                                                              SizedBox(
                                                                width: 1.w,
                                                              ),
                                                              Container(
                                                                height: 3.5.w,
                                                                width: 3.5.w,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border.all(
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        width: 7
                                                                            .sp),
                                                                    color: AppColors
                                                                        .whiteColor),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                          ],
                                        ),
                              SizedBox(
                                height: 2.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.offAll(adviceTicketsScreen());
                                },
                                child: Container(
                                  width: Device.width,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.2.h, horizontal: 4.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.cardBgColor,
                                      borderRadius: BorderRadius.circular(5.w)),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Advice Tickets',
                                        style: TextStyle(
                                            color: AppColors.bgColor,
                                            fontWeight: FontWeight.w100,
                                            fontFamily: FontFamily.extraBold,
                                            fontSize: 17.5.sp),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            subscriptionsdateleft
                                                        ?.subscriptions?[0]
                                                        .status ==
                                                    'cancelled'
                                                ? ""
                                                : subscriptionsdateleft
                                                        ?.subscriptions?[0]
                                                        .planName ??
                                                    "N/A",
                                            style: TextStyle(
                                                color: AppColors.bgColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontFamily.light,
                                                fontSize: 15.sp),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Container(
                                            width: Device.width,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h, horizontal: 4.w),
                                            decoration: BoxDecoration(
                                                color: AppColors.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: allTicket?.data?.length ==
                                                        null ||
                                                    allTicket?.data?.length == 0
                                                ? Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "No Ticket Available",
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.bgColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              FontFamily.light,
                                                          fontSize: 15.sp),
                                                    ),
                                                  )
                                                : Column(
                                                    children: [
                                                      for (int i = 0;
                                                          i <
                                                              (allTicket?.data
                                                                      ?.length ??
                                                                  0);
                                                          i++) ...[
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          9.sp),
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    width: 6.sp,
                                                                    color: AppColors
                                                                        .bgColor),
                                                              ),
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .doc_richtext,
                                                                color: AppColors
                                                                    .bgColor,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 2.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width: 68.w,
                                                                  child: Text(
                                                                    '${allTicket?.data?[i].subject ?? "N/A"}',
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .bgColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            FontFamily
                                                                                .light,
                                                                        fontSize:
                                                                            15.sp),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '#${allTicket?.data?[i].ticketNumber ?? "N/A"}',
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .border,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .bold,
                                                                      fontSize:
                                                                          15.sp),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ).paddingSymmetric(
                                                            vertical: 1.h),
                                                      ],
                                                    ],
                                                  ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (isTimeExceed) {
                                            showCupertinoDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CupertinoAlertDialog(
                                                  title: Text(
                                                    'Monthly Advice Time Exceeded',
                                                    style: TextStyle(
                                                        fontSize: 18.sp),
                                                  ),
                                                  content: Text(
                                                    'Please upgrade your membership to create a new ticket.',
                                                    style: TextStyle(
                                                        fontSize: 17.sp),
                                                  ),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      child: Text('Cancel'),
                                                      onPressed: () {
                                                        Get.back(); // Dismiss dialog
                                                      },
                                                    ),
                                                    CupertinoDialogAction(
                                                      child: Text('Upgrade'),
                                                      isDestructiveAction: true,
                                                      onPressed: () {
                                                        Get.back();
                                                        Get.to(
                                                            membershipPageScreen());
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            Get.to(CreateTicketScreen());
                                          }
                                        },
                                        child: Container(
                                          height: 5.h,
                                          width: 60.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: AppColors.blueColor,
                                              borderRadius:
                                                  BorderRadius.circular(900)),
                                          child: Text(
                                            'Create a New Ticket',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontFamily.bold),
                                          ),
                                        ),
                                      ).marginSymmetric(horizontal: 2.w)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              InkWell(
                                onTap: () => Get.to(
                                  WebviewScreen(
                                    link:
                                        "https://academy.theadvicecentre.ltd/#/login",
                                  ),
                                ),
                                child: Image.asset(
                                  Imgs.new1HomeImage,
                                  scale: 4.5,
                                  // color: AppColors.whiteColor,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              InkWell(
                                onTap: () => Get.to(
                                  WebviewScreen(
                                    link:
                                        "https://introducers.theadvicecentre.ltd/home",
                                  ),
                                ),
                                child: Image.asset(
                                  Imgs.newHomeImage,
                                  scale: 5,
                                  // color: AppColors.whiteColor,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 2.w, vertical: 1.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 2.h),
                            width: Device.width,
                            color: Color(0xff232f3f),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Extra Support:",
                                      style: TextStyle(
                                        fontFamily: FontFamily.extraBold,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor,
                                        fontSize: 17.sp,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.5.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.whiteColor),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Imgs.amz,
                                              scale: 5.5,
                                              // color: AppColors.yellowColor1,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                    amzAdviceFindOutMoreScreen());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.5.w,
                                                    vertical: 1.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: Color(0xfff2811b)),
                                                child: Text(
                                                  "Find Out More",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.w,
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
                                              scale: 3.1,
                                              // color: AppColors.yellowColor1,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                    marketingAgencyFindOutMorePageScreen());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.4.w,
                                                    vertical: 1.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: Color(0xff2070af)),
                                                child: Text(
                                                  "Find Out More",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.4.w, vertical: 1.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.whiteColor),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Imgs.amzagency,
                                              scale: 3.2,
                                              // color: AppColors.yellowColor1,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                    amzAgencyFindOutMoreScreen());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.4.w,
                                                    vertical: 1.h),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color:
                                                        AppColors.orangeColor),
                                                child: Text(
                                                  "Find Out More",
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.bold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.whiteColor,
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.offAll(manageMembershipScreen());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.5.w,
                                              vertical: 0.80.h),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColors.whiteColor),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                Imgs.arrowyellow,
                                                scale: 3.2,
                                                // color: AppColors.yellowColor1,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Full Services",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FontFamily.bold,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_outlined,
                                                    color: AppColors.blackColor,
                                                    size: 14.sp,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InkWell(
                            onTap: () => Get.to(
                              WebviewScreen(
                                link:
                                    "https://www.amzadvicecentre.com/free-amazon-training",
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 1.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFE259),
                                    Color(0xFFFFA751)
                                  ], // yellow to orange
                                ),
                              ),
                              child: Text(
                                "Join Alex’s FREE Online Amazon Training here",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontFamily.bold,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            width: Device.width,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 1.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffe9e7e7)),
                            child: Column(
                              children: [
                                Text(
                                  "What’s New",
                                  style: TextStyle(
                                      fontFamily: FontFamily.bold,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                      fontSize: 22.sp),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                InkWell(
                                  onTap: () => Get.to(
                                    WebviewScreen(
                                      link:
                                          "https://www.amzadvicecentre.com/news/",
                                    ),
                                  ),
                                  child: Image.asset(
                                    Imgs.homepageone,
                                    scale: 1.3,
                                    // color: AppColors.whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                InkWell(
                                  onTap: () => Get.to(
                                    WebviewScreen(
                                      link:
                                          "https://www.marketingadvicecentre.co.uk/news/",
                                    ),
                                  ),
                                  child: Image.asset(
                                    Imgs.homepagetwpphoto,
                                    scale: 1.3,
                                    // color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
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
        child: AppBottombar(selected: 1),
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
            String? lastBillingAtStr;
            String? nextBillingAtStr;
            setState(() {
              // isLoading = false;
            });
            if (subscriptionsdateleft?.subscriptions?.length != 0) {
              allTicketApi();
              planDetailsApi(subscriptionsdateleft?.subscriptions?[0].planCode);

              log("subscription date===>>>>${subscriptionsdateleft?.subscriptions?[0].createdAt}");
              log("subscription date===>>>>${subscriptionsdateleft?.subscriptions?[0].nextBillingAt}");
              if (subscriptionsdateleft?.subscriptions?[0].status == "trial") {
                log("subscription date===>>>>${subscriptionsdateleft?.subscriptions?[0].createdAt}");
                log("subscription date===>>>>${subscriptionsdateleft?.subscriptions?[0].trialendsat}");
                lastBillingAtStr =
                    subscriptionsdateleft?.subscriptions?[0].createdAt;
                nextBillingAtStr =
                    subscriptionsdateleft?.subscriptions?[0].trialendsat;

                if (lastBillingAtStr != null && nextBillingAtStr != null) {
                  DateTime nextBillingAt = DateTime.parse(nextBillingAtStr);
                  String? rawDate =
                      subscriptionsdateleft?.subscriptions?[0].trialendsat;
                  if (rawDate != null) {
                    DateTime parsedDate = DateTime.parse(rawDate);
                    setState(() {
                      dayWithSuffix = getDayWithSuffix(parsedDate);
                    });
                    log("Subscription Day Only ===>>>> $dayWithSuffix");
                  }
                  setState(() {
                    daysRemaining =
                        nextBillingAt.difference(DateTime.now()).inDays;
                  });

                  log("Total Days: $daysRemaining");
                } else {
                  log("No Date Available");
                }
              } else {
                lastBillingAtStr =
                    subscriptionsdateleft?.subscriptions?[0].createdAt;
                nextBillingAtStr =
                    subscriptionsdateleft?.subscriptions?[0].nextBillingAt;

                if (lastBillingAtStr != null && nextBillingAtStr != null) {
                  DateTime nextBillingAt = DateTime.parse(nextBillingAtStr);
                  String? rawDate =
                      subscriptionsdateleft?.subscriptions?[0].nextBillingAt;
                  if (rawDate != null) {
                    DateTime parsedDate = DateTime.parse(rawDate);
                    setState(() {
                      dayWithSuffix = getDayWithSuffix(parsedDate);
                    });
                    log("Subscription Day Only ===>>>> $dayWithSuffix");
                  }
                  setState(() {
                    daysRemaining =
                        nextBillingAt.difference(DateTime.now()).inDays;
                  });

                  log("Total Days: $daysRemaining");
                } else {
                  log("No Date Available");
                }
              }
            } else {
              setState(() {
                daysRemaining = 0;
              });
            }
          } else if (response.statusCode == 57) {
            setState(() {
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
        }).catchError((error, straceTrace) {
          final errorMessage = error.toString();
          log("error=====>>>>$errorMessage  $straceTrace");

          if (errorMessage
              .contains("You are not authorized to perform this operation")) {
            log("User not authorized, retaking token...");
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

//   allTicketApi() {
//     checkInternet().then((internet) async {
//       if (internet) {
//         HomeProvider().Viewalltikit().then((response) async {
//           allTicket = MyTickitModal.fromJson(json.decode(response.body));
//
//           if (response.statusCode == 200) {
//             if (subscriptionsdateleft?.subscriptions?[0].status ==
//                 'cancelled') {
//               totalAdviceTime = 0;
//               checkAndStoreTimeExceeded();
//               bool status = await getTimeExceededStatus();
//               setState(() {
//                 isTimeExceed = status;
//
//                 isLoading = false;
//               });
//             } else {
//               List<int> secondsSpentList = [];
//
//               if (allTicket?.data != null && allTicket!.data!.isNotEmpty) {
//                 for (var ticket in allTicket!.data!) {
//                   final ticketId = ticket.id;
//                   if (ticketId != null) {
//                     print(
//                         "Start Date: ${subscriptionsdateleft?.subscriptions?[0].currentTermStartsAt}");
//                     print(
//                         "End Date: ${subscriptionsdateleft?.subscriptions?[0].currentTermEndsAt}");
//                     log("subscription Start===>>>>${subscriptionsdateleft?.subscriptions?[0].customFieldHash?.cfStartDateTime}");
//                     await HomeProvider()
//                         .getTimeEntryApi(ticketId)
//                         .then((timeResponse) async {
//                       getTimeEntry = GetTimeEntryModal.fromJson(
//                           json.decode(timeResponse.body));
//
//                       if (timeResponse.statusCode == 200 &&
//                           getTimeEntry?.data != null &&
//                           getTimeEntry!.data!.isNotEmpty) {
//                         for (var entry in getTimeEntry!.data!) {
//                           print("🕓 Entry Created Time: ${entry.createdTime}");
//
//                           // Parse entry created time
//                           DateTime? createdTime =
//                               DateTime.tryParse(entry.createdTime.toString());
//
//                           // Parse subscription start and end as full DateTime
//                           String? startDateStr = subscriptionsdateleft
//                               ?.subscriptions?[0].currentTermStartsAt;
//                           String? endDateStr = subscriptionsdateleft
//                               ?.subscriptions?[0].currentTermEndsAt;
//
//                           DateTime? termStart = startDateStr != null
//                               ? DateTime.tryParse(
//                                   "${startDateStr}T00:00:00.000Z")
//                               : null;
//
//                           DateTime? termEnd = endDateStr != null
//                               ? DateTime.tryParse("${endDateStr}T23:59:59.999Z")
//                               : null;
//
//                           if (createdTime != null &&
//                               termStart != null &&
//                               termEnd != null) {
//                             if (createdTime.isAfter(termStart) &&
//                                 createdTime.isBefore(termEnd)) {
//                               final int seconds =
//                                   int.tryParse(entry.secondsSpent.toString()) ??
//                                       0;
//                               final int minutes =
//                                   int.tryParse(entry.minutesSpent.toString()) ??
//                                       0;
//                               final int hours =
//                                   int.tryParse(entry.hoursSpent.toString()) ??
//                                       0;
//
//                               int totalEntrySeconds =
//                                   seconds + (minutes * 60) + (hours * 3600);
//                               secondsSpentList.add(totalEntrySeconds);
//                               print(
//                                   "✅ Time counted: $totalEntrySeconds seconds");
//                             } else {
//                               print(
//                                   "❌ Skipped: $createdTime not within $termStart → $termEnd");
//                             }
//                           } else {
//                             print("⚠️ Date parsing failed");
//                           }
//                         }
//                       }
//                     }).catchError((error) {
//                       log("Error fetching time entry for ticket ID $ticketId: $error");
//                     });
//                   }
//                 }
//               }
//
//               // 🔢 Calculate total seconds
//               int totalSeconds =
//                   secondsSpentList.fold(0, (sum, element) => sum + element);
//               totalSpentTime = totalSeconds;
//               checkAndStoreTimeExceeded();
//               isTimeExceed = await getTimeExceededStatus();
//               print("Is time exceeded: $isTimeExceed");
//               print("All seconds spent list: $secondsSpentList");
//               print("Total seconds spent: $totalSpentTime");
//
//               setState(() {
//                 isLoading = false;
//               });
//             }
//           } else {
//             setState(() {
//               isLoading = false;
//             });
//           }
//         }).catchError((error, straceTrace) {
//           final errorMessage = error.toString();
//
//           if (errorMessage
//               .contains("You are not authorized to perform this operation")) {
//             log("User not authorized, retaking token...");
//             fetchAuthtokenApi();
//             return;
//           }
// if(mounted)
//           setState(() {
//             isLoading = false;
//           });
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }

  void allTicketApi() {
    print('Hellooo kaa');
    checkInternet().then((internet) async {
      if (internet) {
        print('Hellooo ki he');
        HomeProvider().Viewalltikit().then((response) async {
          allTicket = MyTickitModal.fromJson(json.decode(response.body));
          print('Hellooo');
          if (response.statusCode == 200) {
            if (subscriptionsdateleft?.subscriptions?[0].status ==
                'cancelled') {
              print('Here');
              totalAdviceTime = 0;
              checkAndStoreTimeExceeded();
              bool status = await getTimeExceededStatus();
              setState(() {
                isTimeExceed = status;
                isLoading = false;
              });
            } else {
              print('Now Here');
              List<int> secondsSpentList = [];

              if (allTicket?.data != null && allTicket!.data!.isNotEmpty) {
                for (var ticket in allTicket!.data!) {
                  final ticketId = ticket.id;
                  if (ticketId != null) {
                    print(
                        "Start Date (cfStartDateTime): ${subscriptionsdateleft?.subscriptions?[0].customFieldHash?.cfStartDateTime}");
                    print(
                        "End Date (currentTermEndsAt): ${subscriptionsdateleft?.subscriptions?[0].currentTermEndsAt}");
                    log("subscription Start===>>>>${subscriptionsdateleft?.subscriptions?[0].customFieldHash?.cfStartDateTime}");

                    await HomeProvider()
                        .getTimeEntryApi(ticketId)
                        .then((timeResponse) async {
                      getTimeEntry = GetTimeEntryModal.fromJson(
                          json.decode(timeResponse.body));

                      if (timeResponse.statusCode == 200 &&
                          getTimeEntry?.data != null &&
                          getTimeEntry!.data!.isNotEmpty) {
                        for (var entry in getTimeEntry!.data!) {
                          print("🕓 Entry Created Time: ${entry.createdTime}");

                          DateTime? createdTime =
                              DateTime.tryParse(entry.createdTime.toString());

                          String? startDateStr = subscriptionsdateleft
                              ?.subscriptions?[0]
                              .customFieldHash
                              ?.cfStartDateTime;
                          String? endDateStr = subscriptionsdateleft
                              ?.subscriptions?[0].currentTermEndsAt;

                          DateTime? termStart;
                          if (startDateStr != null) {
                            try {
                              final DateFormat formatter =
                                  DateFormat('dd/MM/yyyy hh:mm a');
                              termStart = formatter
                                  .parse(startDateStr)
                                  .toUtc(); // ✅ Fix here
                            } catch (e) {
                              print("❌ Failed to parse cfStartDateTime: $e");
                            }
                          }

                          DateTime? termEnd = endDateStr != null
                              ? DateTime.tryParse("${endDateStr}T23:59:59.999Z")
                              : null;

                          if (createdTime != null &&
                              termStart != null &&
                              termEnd != null) {
                            print(
                                "🔍 Checking if $createdTime is between $termStart and $termEnd");

                            if (createdTime.isAfter(termStart) &&
                                createdTime.isBefore(termEnd)) {
                              final int seconds =
                                  int.tryParse(entry.secondsSpent.toString()) ??
                                      0;
                              final int minutes =
                                  int.tryParse(entry.minutesSpent.toString()) ??
                                      0;
                              final int hours =
                                  int.tryParse(entry.hoursSpent.toString()) ??
                                      0;

                              int totalEntrySeconds =
                                  seconds + (minutes * 60) + (hours * 3600);
                              secondsSpentList.add(totalEntrySeconds);

                              final duration =
                                  Duration(seconds: totalEntrySeconds);
                              final formatted = duration
                                  .toString()
                                  .split('.')
                                  .first
                                  .padLeft(8, "0");

                              print(
                                  "✅ Time counted: $formatted (Total $totalEntrySeconds seconds)");
                            } else {
                              print(
                                  "❌ Skipped: $createdTime not within $termStart → $termEnd");
                            }
                          } else {
                            print(
                                "⚠️ Date parsing failed: start=$termStart, end=$termEnd, created=$createdTime");
                          }
                        }
                      }
                    }).catchError((error) {
                      log("❗ Error fetching time entry for ticket ID $ticketId: $error");
                    });
                  }
                }
              }

              // Final calculation
              int totalSeconds =
                  secondsSpentList.fold(0, (sum, element) => sum + element);
              totalSpentTime = totalSeconds;
              checkAndStoreTimeExceeded();
              isTimeExceed = await getTimeExceededStatus();

              final totalDuration = Duration(seconds: totalSpentTime);
              final readableDuration =
                  totalDuration.toString().split('.').first.padLeft(8, "0");

              print("🧮 All seconds spent list: $secondsSpentList");
              print(
                  "⏱️ Total seconds spent: $totalSpentTime ($readableDuration)");
              print("📛 Is time exceeded: $isTimeExceed");

              setState(() {
                isLoading = false;
              });
            }
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, stackTrace) {
          final errorMessage = error.toString();

          if (errorMessage
              .contains("You are not authorized to perform this operation")) {
            log("🔐 User not authorized, retaking token...");
            fetchAuthtokenApi();
            return;
          }

          if (mounted) {
            setState(() {
              isLoading = false;
            });
            log('Error : ${stackTrace.toString()}');
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  String dayWithSuffix = "";

  String getDayWithSuffix(DateTime date) {
    int day = date.day;
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  fetchAuthtokenApi() {
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

  String? selectedMembershipProduct;
  String? selectedMembership;

  List<Pllans.Plans> plansList = [];

  getPlansApi() {
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider().fetchPlansApi().then((response) async {
          allPlans = Pllans.AllPlansModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            print("data=====>>>>>>>");
            setState(() {
              plansList = allPlans?.plans ?? [];
              // isLoading = false;
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
          log("error=====>>>>${stackTrace}");
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

  Future<void> planDetailsApi(plancode) async {
    bool internet = await checkInternet();

    if (!internet) {
      setState(() {
        isLoading = false;
      });
      buildErrorDialog(context, 'Error', "Internet Required");
      return;
    }

    try {
      final response = await HomeProvider().planDetailsApi(plancode);
      planDetails = PlanDetailsModal.fromJson(json.decode(response.body));

      if (response.statusCode == 200) {
        print("data=====>>>>>>>");
        print(planDetails?.plans?[0].customFields?.length);

        if ((planDetails?.plans?[0].customFields)?.isNotEmpty ?? false) {
          int totalAdviceTimeInMinutes = int.parse(
            (planDetails?.plans?[0].customFields?[0].value).toString(),
          );
          totalAdviceTime = totalAdviceTimeInMinutes * 60;

          print("totalAdviceTime : $totalAdviceTime");

          setState(() {
            // Optionally update UI if needed
          });
        } else {
          totalAdviceTime = 0;
          checkAndStoreTimeExceeded();
          bool status = await getTimeExceededStatus();

          setState(() {
            isTimeExceed = status;
          });
        }
      } else if (response.statusCode == 422) {
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (error, stackTrace) {
      log("error=====>>>>$stackTrace");
      setState(() {
        isLoading = false;
      });
    }
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
              duration: Duration(milliseconds: 250),
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
            subscriptionsViewApi();
            showCustomSuccessSnackbar(
              title: 'Membership Resumed',
              message: 'Your membership has been successfully resumed.',
            );
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
                      Icon(null),
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
                                borderSide: BorderSide(
                                    width: 1.5, color: AppColors.border),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.w),
                                borderSide: BorderSide(
                                    width: 1.5, color: AppColors.border),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.w),
                                borderSide: BorderSide(
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
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.back();
                      subscriptionResumeApi();
                    }
                  },
                  child: Text('Done'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  fetchContractApi(id) {
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider().fetchCustomerApi(id).then((response) async {
          getCustomer =
              GetCustomerDataModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Fetch Error", message: getCustomer?.message ?? '');
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          } else {
            showCustomErrorSnackbar(
              title: 'Fetch Error',
              message: getCustomer?.message ?? '',
            );
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          }
        }).catchError((error, stackTrace) {
          showCustomErrorSnackbar(
            title: 'Fetch Error',
            message: error.toString(),
          );
          log("Error ========>>>>>>>>${stackTrace.toString()}");
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
