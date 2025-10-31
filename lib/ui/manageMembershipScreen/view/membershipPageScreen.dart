import 'dart:convert';
import 'dart:developer' as dev show log;
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/adviceTicketsScreen/view/adviceTicketsScreen.dart';
import 'package:zohosystem/ui/bills&Payments/view/bills&PaymentsScreen.dart';
import 'package:zohosystem/ui/homeScreen/view/homeScreen.dart';
import 'package:zohosystem/ui/manageMembershipScreen/modal/pauseSubscriptionModal.dart';
import 'package:zohosystem/ui/manageMembershipScreen/view/manageMembershipScreen.dart';
import 'package:zohosystem/ui/manageMembershipScreen/view/verifyPaymentsScripationScreen.dart';
import 'package:zohosystem/utils/textFields.dart';

import '../../../apiCalling/Loader.dart';
import '../../../apiCalling/apiConfig.dart';
import '../../../apiCalling/buildErrorDialog.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../apiCalling/saveUserToken.dart';
import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/snackBars.dart';
import '../../authentications/login/modal/authTokenModal.dart';
import '../../authentications/login/provider/loginProvider.dart';
import '../../authentications/signup/modal/allPlansModal.dart' as Pllans;
import '../../authentications/signup/modal/allProductsModal.dart';
import '../../authentications/signup/modal/createSubscriptionModal.dart';
import '../../authentications/signup/provider/signupProvider.dart';
import '../../homeScreen/modal/allTicketModal.dart';
import '../../homeScreen/modal/getTimeEntryModal.dart';
import '../../homeScreen/modal/planDetailsModal.dart';
import '../../homeScreen/modal/subscriptionsDateModal.dart';
import '../../homeScreen/provider/homeProvider.dart';
import '../modal/cancalSubcariptionModal.dart';
import '../modal/resumeSubscriptionModal.dart';
import '../modal/updateSubscriptionModal.dart';
import '../provider/membershipProvider.dart';

class SubscriptionTimeData {
  int totalAdviceTime = 0;
  int totalSpentTime = 0;
  bool isTimeExceed = false;
  String subscriptionId;

  SubscriptionTimeData({required this.subscriptionId});
}

class membershipPageScreen extends StatefulWidget {
  const membershipPageScreen({super.key});

  @override
  State<membershipPageScreen> createState() => _membershipPageScreenState();
}

class _membershipPageScreenState extends State<membershipPageScreen> {
  bool? isTrial;
  bool isPlanChange = false;
  String selectedButton = '';
  String? selectedMembershipProduct;
  String? selectedMembership;
  List<Products> productsList = [];
  List<Pllans.Plans> plansList = [];
  bool isTimeExceed = false;

  // Add page controller and current page index for membership section only
  PageController _membershipPageController = PageController();
  int _currentMembershipPage = 0;

  // Subscription time tracking
  final Map<String, SubscriptionTimeData> _subscriptionTimeData = {};

  // Helper method to get current subscription
  Subscriptions? _getCurrentSubscription() {
    if (subscriptionsDate?.subscriptions == null ||
        subscriptionsDate!.subscriptions!.isEmpty) {
      return null;
    }
    return subscriptionsDate!.subscriptions![_currentMembershipPage];
  }

  // Helper method to check if there are active subscriptions
  bool _hasActiveSubscription() {
    return subscriptionsDate?.subscriptions != null &&
        subscriptionsDate!.subscriptions!.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();

    _membershipPageController = PageController();
    _initializePageController();
    setState(() {
      totalAdviceTime = 0;
      totalSpentTime = 0;
    });
    subscriptionsViewApi();
  }

  void _initializePageController() async {
    final prefs = await SharedPreferences.getInstance();
    final savedId = prefs.getString('selectedSubscriptionId');
    int initialPage = 0;

    // Calculate initial page based on saved ID
    if (savedId != null && subscriptionsDate?.subscriptions != null) {
      final savedIndex = subscriptionsDate!.subscriptions!
          .indexWhere((sub) => sub.subscriptionId == savedId);
      if (savedIndex != -1) {
        initialPage = savedIndex;
      }
    }

    _membershipPageController = PageController(initialPage: initialPage);
    setState(() {
      _currentMembershipPage = initialPage;
    });
  }

  @override
  void dispose() {
    _membershipPageController.dispose();
    super.dispose();
  }

  // Update time data for current subscription
  void _updateTimeDataForCurrentSubscription() {
    final currentSubscription = _getCurrentSubscription();
    if (currentSubscription != null) {
      final subscriptionId = currentSubscription.subscriptionId ?? '';

      // Initialize if not exists
      if (!_subscriptionTimeData.containsKey(subscriptionId)) {
        _subscriptionTimeData[subscriptionId] = SubscriptionTimeData(
          subscriptionId: subscriptionId,
        );
      }

      // Update UI with current subscription's data
      final currentTimeData = _subscriptionTimeData[subscriptionId]!;
      setState(() {
        totalAdviceTime = currentTimeData.totalAdviceTime;
        totalSpentTime = currentTimeData.totalSpentTime;
        isTimeExceed = currentTimeData.isTimeExceed;
      });

      // Fetch fresh data for this subscription
      allTicketApi();
      if (currentSubscription.planCode != null) {
        planDetailsApi(currentSubscription.planCode);
      }
      _calculateDaysRemaining(currentSubscription);
    }
  }

  Future<bool> getTimeExceededStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isTimeExceeded") ?? false;
  }

  void checkAndStoreTimeExceeded() async {
    final isExceeded = totalSpentTime >= totalAdviceTime;
    print('isExceeded : $isExceeded');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isTimeExceeded", isExceeded);
  }

  int totalAdviceTime = 0;
  int totalSpentTime = 0;
  bool cancelSubscriptionData = false;
  int daysRemaining = 0;
  bool isLoading = true;
  int selectedPauseOption = 1;
  final TextEditingController _reasonController = TextEditingController();
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _pauseFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Loader()
          : Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
                                TextSpan(
                                  text: "HERE",
                                  style: TextStyle(
                                    fontFamily: FontFamily.bold,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                    fontSize: 19.sp,
                                    decorationColor: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Get.to(
                                      //   manageMembershipScreen(),
                                      //   transition: Transition.rightToLeft,
                                      //   duration: Duration(milliseconds: 250),
                                      // );
                                    },
                                ),
                              ],
                            ),
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
                              // Swipeable Membership Section Only
                              _buildSwipeableMembershipSection(),
                              SizedBox(height: 2.h),

                              // Upgrade/Downgrade Buttons
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedButton = 'upgrade';
                                      });
                                      _showStatefulBottomSheet(
                                          context, selectedButton);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.5.w, vertical: 1.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          color: const Color(0xff2273bb)),
                                      child: Text(
                                        "Upgrade Membership",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedButton = 'downgrade';
                                      });
                                      _showStatefulBottomSheet(
                                          context, selectedButton);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.w, vertical: 1.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          color: const Color(0xff2273bb)),
                                      child: Text(
                                        "Downgrade Membership",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(const manageMembershipScreen());
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.w, vertical: 1.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          color: AppColors.orangeColor),
                                      child: Text(
                                        "Add an Additional Membership",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),

                              // Monthly Advice Time Section
                              Container(
                                width: Device.width,
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.2.h, horizontal: 1.w),
                                decoration: BoxDecoration(
                                    color: AppColors.cardBgColor,
                                    borderRadius: BorderRadius.circular(5.w)),
                                child: isTicketLoad
                                    ? Loader()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Monthly Advice Time",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppColors.bgColor,
                                                fontWeight: FontWeight.w100,
                                                fontFamily:
                                                    FontFamily.extraBold,
                                                fontSize: 20.sp),
                                          ).paddingSymmetric(horizontal: 3.w),
                                          SizedBox(height: 1.h),
                                          _getCurrentSubscription()?.status ==
                                                  'paused'
                                              ? Text(
                                                  'Membership is currently paused please resume it to see details',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: AppColors.bgColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          FontFamily.light,
                                                      fontSize: 17.sp),
                                                )
                                              : Text(
                                                  _getCurrentSubscription()
                                                          ?.planName ??
                                                      "N/A",
                                                  style: TextStyle(
                                                      color: AppColors.bgColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          FontFamily.light,
                                                      fontSize: 15.sp),
                                                ),
                                          SizedBox(height: 0.7.h),
                                          _getCurrentSubscription()?.status ==
                                                  'paused'
                                              ? Container()
                                              : Container(
                                                  height: 35.w,
                                                  width: 35.w,
                                                  padding:
                                                      EdgeInsets.all(11.sp),
                                                  decoration:
                                                      const BoxDecoration(
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
                                                          color:
                                                              AppColors.bgColor,
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              (totalAdviceTime -
                                                                              totalSpentTime)
                                                                          .clamp(
                                                                              0,
                                                                              totalAdviceTime) <
                                                                      60
                                                                  ? "${(totalAdviceTime - totalSpentTime).clamp(0, totalAdviceTime)}"
                                                                  : ((totalAdviceTime - totalSpentTime).clamp(
                                                                              0,
                                                                              totalAdviceTime) /
                                                                          60)
                                                                      .toStringAsFixed(
                                                                          0),
                                                              style: TextStyle(
                                                                color: AppColors
                                                                    .bgColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .bold,
                                                                fontSize: 22.sp,
                                                              ),
                                                            ),
                                                            Text(
                                                              (totalAdviceTime -
                                                                              totalSpentTime)
                                                                          .clamp(
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
                                                                height: 1.5.h)
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ],
                                      ),
                              ),
                              _getCurrentSubscription()?.status == 'paused'
                                  ? Container()
                                  : SizedBox(height: 1.h),
                              Text(
                                'Your Monthly Advice Time is tracked by professional time-tracking software. If you have any questions about how to make the most of your allocated Monthly Advice Time, feel free to reach out!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.bgColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontFamily.bold,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              // Billing Section
                              _getCurrentSubscription()?.status == 'paused'
                                  ? Container()
                                  : _buildBillingSection(),
                              SizedBox(height: 1.h),

                              // Additional Sections
                              _buildAdditionalSections(),
                              SizedBox(height: 2.h),
                            ],
                          ).paddingSymmetric(horizontal: 2.w, vertical: 2.h),
                        ),
                      ),
                    ),
                  ],
                ),
                if (isPlanChange)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(child: Loader()),
                  ),
              ],
            ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppBottombar(selected: 2),
      ),
    );
  }

  // Swipeable Membership Section Only
  Widget _buildSwipeableMembershipSection() {
    if (!_hasActiveSubscription()) {
      return Container(
        width: Device.width,
        padding: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 3.w),
        decoration: BoxDecoration(
            color: AppColors.cardBgColor,
            borderRadius: BorderRadius.circular(5.w)),
        child: Column(
          children: [
            Text(
              'Your Active Memberships',
              style: TextStyle(
                  color: AppColors.bgColor,
                  fontWeight: FontWeight.w100,
                  fontFamily: FontFamily.extraBold,
                  fontSize: 17.5.sp),
            ),
            SizedBox(height: 1.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "No Membership Available",
                  style: TextStyle(
                      color: AppColors.bgColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.light,
                      fontSize: 15.sp),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Container(
          width: Device.width,
          padding: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 3.w),
          decoration: BoxDecoration(
              color: AppColors.cardBgColor,
              borderRadius: BorderRadius.circular(5.w)),
          child: Column(
            children: [
              Text(
                'Your Active Memberships',
                style: TextStyle(
                    color: AppColors.bgColor,
                    fontWeight: FontWeight.w100,
                    fontFamily: FontFamily.extraBold,
                    fontSize: 17.5.sp),
              ),
              SizedBox(height: 1.h),
              SizedBox(
                height: 11.h,
                child: PageView.builder(
                  controller: _membershipPageController,
                  itemCount: subscriptionsDate!.subscriptions!.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentMembershipPage = page;
                      _updateTimeDataForCurrentSubscription();
                    });
                  },
                  itemBuilder: (context, index) {
                    final subscription =
                        subscriptionsDate!.subscriptions![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subscription.name ?? "N/A",
                          style: TextStyle(
                            color: AppColors.bgColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.light,
                            fontSize: 15.sp,
                          ),
                        ),
                        const Divider(
                          color: AppColors.bgColor,
                          thickness: 0.5,
                        ),
                        Text(
                          subscription.planName ?? "N/A",
                          style: TextStyle(
                            color: AppColors.bgColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.light,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // Page Indicators only for membership section
        if (_hasActiveSubscription() &&
            subscriptionsDate!.subscriptions!.length > 1)
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                subscriptionsDate!.subscriptions!.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  width: 3.w,
                  height: 3.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentMembershipPage == index
                        ? AppColors.bgColor
                        : AppColors.bgColor.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  // Billing Section
  Widget _buildBillingSection() {
    final currentSubscription = _getCurrentSubscription();

    if (currentSubscription == null) {
      return Container();
    }

    final hasPauseDate = currentSubscription.pauseDate != '' &&
        currentSubscription.pauseDate != null;

    if (!hasPauseDate) {
      return _buildNormalBillingSection(currentSubscription);
    } else {
      return _buildPausingPlanSection(currentSubscription);
    }
  }

  Widget _buildNormalBillingSection(Subscriptions subscription) {
    return Container(
      width: Device.width,
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
      decoration: BoxDecoration(
          color: AppColors.cardBgColor,
          borderRadius: BorderRadius.circular(5.w)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Next Billing \nDate',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.bgColor,
                    fontWeight: FontWeight.w100,
                    fontFamily: FontFamily.extraBold,
                    fontSize: 18.5.sp),
              ).paddingSymmetric(horizontal: 3.w),
              Text(
                subscription.nextBillingAt ?? "",
                style: TextStyle(
                    color: AppColors.bgColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.light,
                    fontSize: 15.sp),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "$daysRemaining",
                style: TextStyle(
                    color: AppColors.orangeColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(width: 2.w),
              Text(
                'days left',
                style: TextStyle(
                    color: AppColors.orangeColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.light,
                    fontSize: 16.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPausingPlanSection(Subscriptions subscription) {
    return Container(
      width: Device.width,
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
      decoration: BoxDecoration(
          color: AppColors.cardBgColor,
          borderRadius: BorderRadius.circular(5.w)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Plan is pausing',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.bgColor,
                        fontWeight: FontWeight.w100,
                        fontFamily: FontFamily.extraBold,
                        fontSize: 18.5.sp),
                  ).paddingSymmetric(horizontal: 3.w),
                  Text(
                    subscription.pauseDate ?? "",
                    style: TextStyle(
                        color: AppColors.bgColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamily.light,
                        fontSize: 15.sp),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      DateTime.parse(subscription.pauseDate ?? '')
                          .difference(DateTime.parse(
                              DateFormat('yyyy-MM-dd').format(DateTime.now())))
                          .inDays
                          .toString(),
                      style: TextStyle(
                          color: AppColors.orangeColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.bold,
                          fontSize: 30.sp),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      'days left',
                      style: TextStyle(
                          color: AppColors.orangeColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.light,
                          fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Additional Sections
  Widget _buildAdditionalSections() {
    final currentSubscription = _getCurrentSubscription();

    return Column(
      children: [
        if (currentSubscription?.status == 'paused') ...[
          _buildResumeSection(),
          SizedBox(height: 1.h),
        ],
        if (currentSubscription?.pauseDate != null &&
            currentSubscription!.pauseDate!.isNotEmpty &&
            currentSubscription.pauseDate !=
                DateFormat('yyyy-MM-dd').format(DateTime.now())) ...[
          _buildStopPausingSection(),
          SizedBox(height: 1.h),
        ],
        _buildBillsPaymentsSection(),
        SizedBox(height: 1.h),
        _buildTicketsSection(),
        SizedBox(height: 1.h),
        if (currentSubscription?.status != 'paused') ...[
          _buildPauseMembershipSection(),
          SizedBox(height: 1.h),
        ],
        _buildCancelMembershipSection(),
      ],
    );
  }

  Widget _buildResumeSection() {
    return InkWell(
      onTap: () {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(
                'Resume Membership',
                style: TextStyle(fontSize: 18.sp),
              ),
              content: Text(
                'Are you sure you want to resume your paused membership?',
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
                    Get.back();
                    subscriptionResumeApi();
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: Device.width,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        decoration: BoxDecoration(
            color: AppColors.cardBgColor,
            borderRadius: BorderRadius.circular(5.w)),
        child: Column(
          children: [
            Text(
              'Click here to',
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal,
                  fontFamily: FontFamily.regular,
                  fontSize: 17.sp),
            ),
            Text(
              'Resume Membership',
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.extraBold,
                  fontSize: 17.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStopPausingSection() {
    return InkWell(
      onTap: () {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(
                'Reactivate Your Paused Membership',
                style: TextStyle(fontSize: 18.sp),
              ),
              content: Text(
                'Please confirm that you would like to Reactivate your Paused Membership?',
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
                    Get.back();
                    stopPausingApi();
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: Device.width,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        decoration: BoxDecoration(
            color: AppColors.cardBgColor,
            borderRadius: BorderRadius.circular(5.w)),
        child: Column(
          children: [
            Text(
              'Click here to',
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal,
                  fontFamily: FontFamily.regular,
                  fontSize: 17.sp),
            ),
            Text(
              'Reactivate Your Paused Membership',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.extraBold,
                  fontSize: 17.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillsPaymentsSection() {
    return InkWell(
      onTap: () {
        Get.to(const BillsnPaymentsscreen());
      },
      child: Container(
        width: Device.width,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        decoration: BoxDecoration(
            color: AppColors.cardBgColor,
            borderRadius: BorderRadius.circular(5.w)),
        child: Column(
          children: [
            Text(
              'Click here to view your recent',
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal,
                  fontFamily: FontFamily.regular,
                  fontSize: 17.sp),
            ),
            Text(
              'Bills & Payments',
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.extraBold,
                  fontSize: 17.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketsSection() {
    return InkWell(
      onTap: () {
        Get.offAll(const adviceTicketsScreen());
      },
      child: Container(
        width: Device.width,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        decoration: BoxDecoration(
            color: AppColors.cardBgColor,
            borderRadius: BorderRadius.circular(5.w)),
        child: Column(
          children: [
            Text(
              'Click here to view your recent',
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal,
                  fontFamily: FontFamily.regular,
                  fontSize: 17.sp),
            ),
            Text(
              'Advice Tickets',
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.extraBold,
                  fontSize: 17.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPauseMembershipSection() {
    return InkWell(
      onTap: () {
        if (daysRemaining < 7) {
          showCustomErrorSnackbar(
              title: 'Sorry',
              message: 'You Can\'t Pause Your Membership Before 7 Days');
        } else {
          showPauseMembershipDialog(context);
        }
      },
      child: Container(
        width: Device.width,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        decoration: BoxDecoration(
            color: AppColors.cardBgColor,
            borderRadius: BorderRadius.circular(5.w)),
        child: Column(
          children: [
            Text(
              'Click here to',
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.normal,
                  fontFamily: FontFamily.regular,
                  fontSize: 17.sp),
            ),
            Text(
              'Pause Your Membership',
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.extraBold,
                  fontSize: 17.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCancelMembershipSection() {
    return cancelSubscriptionData
        ? const Center(child: CircularProgressIndicator())
        : InkWell(
            onTap: () {
              if (daysRemaining < 7) {
                showCustomErrorSnackbar(
                  title: 'Sorry',
                  message: 'You Can\'t Cancel Your Membership Before 7 Days',
                );
              } else {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text(
                        'Confirm Cancellation',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      content: Text(
                        'Are you sure you want to cancel your membership?',
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
                            Get.back();
                            subscriptionCancelApi();
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: Container(
              width: Device.width,
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
              decoration: BoxDecoration(
                  color: AppColors.cardBgColor,
                  borderRadius: BorderRadius.circular(5.w)),
              child: Column(
                children: [
                  Text(
                    'Click here to',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.normal,
                        fontFamily: FontFamily.regular,
                        fontSize: 17.sp),
                  ),
                  Text(
                    'Cancel Your Membership',
                    style: TextStyle(
                        color: AppColors.redColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamily.extraBold,
                        fontSize: 17.sp),
                  ),
                ],
              ),
            ),
          );
  }

  subscriptionsViewApi() {
    checkInternet().then((internet) async {
      if (internet) {
        HomeProvider().subscriptionsViewApi().then((response) async {
          subscriptionsDate =
              SubscriptionsDateModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            // ✅ Remove all subscriptions with status == "cancelled"
            subscriptionsDate?.subscriptions?.removeWhere(
              (sub) => (sub.status?.toLowerCase() == 'cancelled'),
            );

            setState(() {});

            if (subscriptionsDate?.subscriptions?.isNotEmpty ?? false) {
              // Initialize time data map for all subscriptions
              _subscriptionTimeData.clear();
              for (var sub in subscriptionsDate!.subscriptions!) {
                final subId = sub.subscriptionId ?? '';
                _subscriptionTimeData[subId] =
                    SubscriptionTimeData(subscriptionId: subId);
              }

              // ✅ Find and navigate to saved subscription index
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _navigateToSavedSubscription();
              });
              planDetailsApi(_getCurrentSubscription()?.planCode);
              getPlansApi();
              allTicketApi();

              // Load data for current subscription
              _updateTimeDataForCurrentSubscription();
            } else {
              // ✅ No valid subscriptions left
              setState(() {
                isLoading = false;
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

// ✅ New method to navigate to saved subscription
  void _navigateToSavedSubscription() async {
    final prefs = await SharedPreferences.getInstance();
    final savedId = prefs.getString('selectedSubscriptionId');

    if (savedId != null && savedId.isNotEmpty) {
      final subscriptions = subscriptionsDate?.subscriptions ?? [];
      final savedIndex = subscriptions.indexWhere(
        (sub) => sub.subscriptionId == savedId,
      );

      if (savedIndex != -1) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Ensure controller is attached
          if (_membershipPageController.hasClients) {
            _membershipPageController.animateToPage(
              savedIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );

            setState(() {
              _currentMembershipPage = savedIndex;
            });
          } else {
            // Retry after a short delay if controller not ready
            Future.delayed(const Duration(milliseconds: 50), () {
              if (_membershipPageController.hasClients) {
                _membershipPageController.animateToPage(
                  savedIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );

                setState(() {
                  _currentMembershipPage = savedIndex;
                });
              }
            });
          }
        });
      }
    }
  }

  planDetailsApi(plancode) {
    checkInternet().then((internet) async {
      if (internet) {
        HomeProvider().planDetailsApi(plancode).then((response) async {
          planDetails = PlanDetailsModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            print("data=====>>>>>>>");
            setState(() {
              print(planDetails?.plans?[0].customFields?.length);

              final currentSubscription = _getCurrentSubscription();
              final currentSubscriptionId =
                  currentSubscription?.subscriptionId ?? '';

              if ((planDetails?.plans?[0].customFields)!.isNotEmpty) {
                int totalAdviceTimeInMinutes = int.parse(
                    (planDetails?.plans?[0].customFields?[0].value).toString());

                // Update the specific subscription's data
                if (_subscriptionTimeData.containsKey(currentSubscriptionId)) {
                  _subscriptionTimeData[currentSubscriptionId]!
                      .totalAdviceTime = totalAdviceTimeInMinutes * 60;

                  // Update current display
                  setState(() {
                    totalAdviceTime =
                        _subscriptionTimeData[currentSubscriptionId]!
                            .totalAdviceTime;
                  });
                }
              }
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
          log("error=====>>>>$stackTrace");
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

  bool isTicketLoad = true;

  void allTicketApi() {
    setState(() {
      isTicketLoad = true;
    });
    checkInternet().then((internet) async {
      if (internet) {
        final currentSubscription = _getCurrentSubscription();
        final currentSubscriptionId = currentSubscription?.subscriptionId ?? '';

        HomeProvider()
            .Viewalltikit(currentSubscriptionId)
            .then((response) async {
          allTicket = MyTickitModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            List<int> secondsSpentList = [];

            if (allTicket?.data != null && allTicket!.data!.isNotEmpty) {
              for (var ticket in allTicket!.data!) {
                final ticketId = ticket.id;
                if (ticketId != null) {
                  await HomeProvider()
                      .getTimeEntryApi(ticketId)
                      .then((timeResponse) async {
                    getTimeEntry = GetTimeEntryModal.fromJson(
                        json.decode(timeResponse.body));

                    if (timeResponse.statusCode == 200 &&
                        getTimeEntry?.data != null &&
                        getTimeEntry!.data!.isNotEmpty) {
                      for (var entry in getTimeEntry!.data!) {
                        DateTime? createdTime =
                            DateTime.tryParse(entry.createdTime.toString());

                        String? startDateStr = currentSubscription
                            ?.customFieldHash?.cfStartDateTime;
                        String? endDateStr =
                            currentSubscription?.currentTermEndsAt;

                        DateTime? termStart;
                        if (startDateStr != null) {
                          try {
                            final DateFormat formatter =
                                DateFormat('dd/MM/yyyy hh:mm a');
                            termStart = formatter.parse(startDateStr).toUtc();
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
                          if (createdTime.isAfter(termStart) &&
                              createdTime.isBefore(termEnd)) {
                            final int seconds =
                                int.tryParse(entry.secondsSpent.toString()) ??
                                    0;
                            final int minutes =
                                int.tryParse(entry.minutesSpent.toString()) ??
                                    0;
                            final int hours =
                                int.tryParse(entry.hoursSpent.toString()) ?? 0;

                            int totalEntrySeconds =
                                seconds + (minutes * 60) + (hours * 3600);
                            secondsSpentList.add(totalEntrySeconds);
                          }
                        }
                      }
                    }
                  }).catchError((error) {
                    log("❗ Error fetching time entry for ticket ID $ticketId: $error");
                  });
                }
              }

              // Store results in the subscription-specific data
              int totalSeconds =
                  secondsSpentList.fold(0, (sum, element) => sum + element);

              if (_subscriptionTimeData.containsKey(currentSubscriptionId)) {
                _subscriptionTimeData[currentSubscriptionId]!.totalSpentTime =
                    totalSeconds;
                _subscriptionTimeData[currentSubscriptionId]!.isTimeExceed =
                    _subscriptionTimeData[currentSubscriptionId]!
                            .totalSpentTime >=
                        _subscriptionTimeData[currentSubscriptionId]!
                            .totalAdviceTime;

                // Update current display values
                setState(() {
                  totalSpentTime = _subscriptionTimeData[currentSubscriptionId]!
                      .totalSpentTime;
                  isTimeExceed = _subscriptionTimeData[currentSubscriptionId]!
                      .isTimeExceed;
                });
              }

              checkAndStoreTimeExceeded();

              final totalDuration = Duration(seconds: totalSpentTime);
              final readableDuration =
                  totalDuration.toString().split('.').first.padLeft(8, "0");

              print("🧮 All seconds spent list: $secondsSpentList");
              print(
                  "⏱️ Total seconds spent for subscription $currentSubscriptionId: $totalSpentTime ($readableDuration)");
              print("📛 Is time exceeded: $isTimeExceed");

              setState(() {
                isLoading = false;
                isTicketLoad = false;
              });
            }
          } else {
            setState(() {
              isLoading = false;
              isTicketLoad = false;
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
              isTicketLoad = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          isTicketLoad = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  // Helper method to calculate days remaining for current subscription
  void _calculateDaysRemaining(Subscriptions subscription) {
    String? lastBillingAtStr;
    String? nextBillingAtStr;

    if (subscription.status == "trial") {
      lastBillingAtStr = subscription.createdAt;
      nextBillingAtStr = subscription.trialendsat;
    } else {
      lastBillingAtStr = subscription.createdAt;
      nextBillingAtStr = subscription.nextBillingAt;
    }

    if (lastBillingAtStr != null && nextBillingAtStr != null) {
      DateTime nextBillingAt = DateTime.parse(nextBillingAtStr);
      setState(() {
        daysRemaining = nextBillingAt.difference(DateTime.now()).inDays;
      });
      dev.log("Total Days: $daysRemaining");
    } else {
      dev.log("No Date Available");
    }
  }

  subscriptionCancelApi() {
    setState(() {
      isPlanChange = true;
    });
    checkInternet().then((internet) async {
      if (internet) {
        ManageMembershipProvider()
            .subscriptionsCancelApi(_getCurrentSubscription()?.subscriptionId)
            .then((response) async {
          cancelSubscription =
              CancelSubscriptionModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            setState(() {
              isPlanChange = false;
            });
            Get.offAll(const Homescreen());
            showCustomSuccessSnackbar(
                title: 'Subscriptions',
                message: cancelSubscription?.message ?? "");
          } else if (response.statusCode == 422) {
            setState(() {
              isPlanChange = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Subscriptions cancel Error',
              message: 'Internal Server Error',
            );
            setState(() {
              isPlanChange = false;
            });
          }
        }).catchError((error, straceTrace) {
          log("error=====>>>>${error.toString()}  $straceTrace");
          setState(() {
            isPlanChange = false;
          });
        });
      } else {
        setState(() {
          isPlanChange = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  // Keep all your other existing methods (getPlansApi, createSubscriptionApi, updateSubscriptionApi,
  // subscriptionPauseApi, stopPausingApi, cancelAndCreateApi, _showStatefulBottomSheet,
  // showPauseMembershipDialog, fetchAuthtokenApi) exactly as they were in your original code

  getPlansApi() {
    checkInternet().then((internet) async {
      if (internet) {
        Signupprovider().fetchPlansApi().then((response) async {
          allPlans = Pllans.AllPlansModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            String? currentPlanCode = _getCurrentSubscription()?.planCode;

            setState(() {
              plansList = (allPlans?.plans ?? []).where((plan) {
                print('current plan is : $currentPlanCode');
                print('plan plan is : ${plan.planCode}');
                return plan.planCode != currentPlanCode;
              }).toList();
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, stackTrace) {
          log("error=====>>>>$stackTrace");
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

  createSubscriptionApi() {
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
              isPlanChange = false;
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
              isPlanChange = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Register Error',
              message: register?.message ?? '',
            );
            setState(() {
              isPlanChange = false;
            });
          }
        }).catchError((error) {
          log("Error ========>>>>>>>>${error.toString()}");
          setState(() {
            isPlanChange = false;
          });
        });
      } else {
        setState(() {
          isPlanChange = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  updateSubscriptionApi() {
    setState(() {
      isPlanChange = true;
    });
    final Map<String, dynamic> data = {
      'subscription_id': _getCurrentSubscription()?.subscriptionId,
      'plan': {
        "plan_code": selectedMembership,
      },
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
        ManageMembershipProvider()
            .updateSubscriptionApi(data)
            .then((response) async {
          updateSubscription =
              UpdateSubscriptionModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            setState(() {
              isPlanChange = false;
            });
            Get.to(
              VerifyPaymentScripationScreen(
                paymentLink: updateSubscription?.hostedpage?.url ?? '',
              ),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 250),
            );
          } else if (response.statusCode == 400) {
            updateSubscription?.message ==
                    "The plan you've selected belongs to a different product. Select a plan from the same product to proceed."
                ? cancelAndCreateApi()
                : setState(() {
                    isPlanChange = false;
                  });
          } else if (response.statusCode == 422) {
            showCustomErrorSnackbar(
                title: "Update subscription Error",
                message: updateSubscription?.message ?? '');
            setState(() {
              isPlanChange = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Update subscription Error',
              message: updateSubscription?.message ?? '',
            );
            setState(() {
              isPlanChange = false;
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

  subscriptionPauseApi() {
    setState(() {
      isPlanChange = true;
    });
    final Map<String, dynamic> data = {
      "pause_at": selectedPauseOption == 1
          ? DateFormat('yyyy-MM-dd').format(DateTime.now())
          : _dateController.text.trim().toString(),
      "reason": _reasonController.text.trim().toString()
    };

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ManageMembershipProvider()
            .subscriptionsPauseApi(
                data, _getCurrentSubscription()?.subscriptionId)
            .then((response) async {
          pauseMembership =
              PauseMembershipModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            setState(() {
              isPlanChange = false;
            });
            subscriptionsViewApi();
            showCustomSuccessSnackbar(
              title: 'Membership Paused',
              message:
                  'Your membership has been successfully paused. You can resume it anytime from home screen or by going to manage membership screen.',
            );
          } else if (response.statusCode == 422) {
            setState(() {
              isPlanChange = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Subscriptions Pause Error',
              message: 'Internal Server Error',
            );
            setState(() {
              isPlanChange = false;
            });
          }
        }).catchError((error, straceTrace) {
          log("error=====>>>>${error.toString()}  $straceTrace");
          setState(() {
            isPlanChange = false;
          });
        });
      } else {
        setState(() {
          isPlanChange = false;
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
      "resume_at": DateFormat('yyyy-MM-dd').format(DateTime.now()),
      "reason": ''
    };

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ManageMembershipProvider()
            .subscriptionsResumeApi(
                data, _getCurrentSubscription()?.subscriptionId)
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
          dev.log("error=====>>>>${error.toString()}  $straceTrace");
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

  stopPausingApi() {
    setState(() {
      isPlanChange = true;
    });
    final Map<String, dynamic> data = {"pause_at": "", "reason": ""};

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        ManageMembershipProvider()
            .subscriptionsPauseApi(
                data, _getCurrentSubscription()?.subscriptionId)
            .then((response) async {
          pauseMembership =
              PauseMembershipModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            setState(() {
              isPlanChange = false;
            });
            subscriptionsViewApi();
            showCustomSuccessSnackbar(
              title: 'Membership Revoked',
              message:
                  'Your membership has been successfully revoked and will no longer be paused.',
            );
          } else if (response.statusCode == 422) {
            setState(() {
              isPlanChange = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Subscriptions Pause Error',
              message: 'Internal Server Error',
            );
            setState(() {
              isPlanChange = false;
            });
          }
        }).catchError((error, straceTrace) {
          log("error=====>>>>${error.toString()}  $straceTrace");
          setState(() {
            isPlanChange = false;
          });
        });
      } else {
        setState(() {
          isPlanChange = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  cancelAndCreateApi() {
    checkInternet().then((internet) async {
      if (internet) {
        ManageMembershipProvider()
            .subscriptionsCancelApi(_getCurrentSubscription()?.subscriptionId)
            .then((response) async {
          cancelSubscription =
              CancelSubscriptionModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            setState(() {
              cancelSubscriptionData = false;
            });
            createSubscriptionApi();
          } else if (response.statusCode == 422) {
            setState(() {
              cancelSubscriptionData = false;
            });
          } else {
            showCustomErrorSnackbar(
              title: 'Subscriptions cancel Error',
              message: 'Internal Server Error',
            );
            setState(() {
              cancelSubscriptionData = false;
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

  void _showStatefulBottomSheet(BuildContext context, fromButton) {
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
                        fromButton == 'upgrade'
                            ? "Upgrade Membership"
                            : "Downgrade Membership",
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
                  SizedBox(height: 2.h),
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
                              final selectedPlan = plansList.firstWhere(
                                (plan) => plan.planCode == value,
                                orElse: () => Pllans.Plans(),
                              );

                              if (isTrial == false &&
                                  selectedPlan.trialPeriod != 0) {
                                showCustomErrorSnackbar(
                                  title: "Sorry",
                                  message:
                                      "You cannot select a plan with a trial period.",
                                );
                                return;
                              }

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
                  SizedBox(height: 2.h),
                  selectedMembership == null
                      ? Container()
                      : InkWell(
                          onTap: () {
                            Get.back();
                            updateSubscriptionApi();
                          },
                          child: Container(
                            width: Device.width,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: AppColors.blueColor),
                            child: Text(
                              fromButton == 'upgrade' ? "Upgrade" : "Downgrade",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontFamily: FontFamily.bold,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 10.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void showPauseMembershipDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
              contentPadding: EdgeInsets.all(4.w),
              title: Center(
                child: Text('Pause Membership',
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontFamily: FontFamily.bold,
                        fontWeight: FontWeight.bold)),
              ),
              content: SingleChildScrollView(
                child: Form(
                  key: _pauseFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('When do you want to pause this subscription?',
                          style: TextStyle(
                              fontSize: 17.sp, fontFamily: FontFamily.bold)),
                      RadioListTile<int>(
                        value: 1,
                        groupValue: selectedPauseOption,
                        title: Text('Immediately',
                            style: TextStyle(
                                fontSize: 16.sp, fontFamily: FontFamily.bold)),
                        subtitle: Text(
                            'This subscription will be paused immediately.',
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
                            'You can choose the date on which you want to pause this subscription.',
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
                          text: 'Pause On',
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
                            'Mention why are you pausing this subscription',
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
                    if (_pauseFormKey.currentState!.validate()) {
                      Get.back();
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: const Text('Confirm Pause'),
                            content: const Text(
                                'Are you sure you want to pause your membership?'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('No'),
                                onPressed: () => Get.back(),
                              ),
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: () {
                                  Get.back();
                                  subscriptionPauseApi();
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
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
}
