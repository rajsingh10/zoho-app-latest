import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesiq_mobilisten/salesiq_mobilisten.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zohosystem/ui/bills&Payments/view/bills&PaymentsScreen.dart';
import 'package:zohosystem/ui/homeScreen/view/demandServicesScreen.dart';
import 'package:zohosystem/ui/moreScreen/view/moreScreen.dart';
import 'package:zohosystem/ui/partnersScreen/view/partnersScreen.dart';
import 'package:zohosystem/utils/fontFamily.dart';
import 'package:zohosystem/utils/snackBars.dart';

import '../apiCalling/saveUserData.dart';
import '../apiCalling/saveUserToken.dart';
import '../ui/adviceTicketsScreen/view/adviceTicketsScreen.dart';
import '../ui/homeScreen/view/homeScreen.dart';
import '../ui/landingScreen/view/landingScreen.dart';
import '../ui/manageMembershipScreen/view/manageMembershipScreen.dart';
import '../ui/moreScreen/view/formsApprovalsScreen.dart';
import '../ui/moreScreen/view/personalDetailsScreen.dart';
import '../ui/noMembershipScreens/view/webviewScreen.dart';
import '../ui/theAdviceCentreAcademyScreen/view/theAdviceCentreaAademyScreen.dart';
import 'colors.dart';
import 'images.dart';

// ignore: must_be_immutable
class AppBottombar extends StatefulWidget {
  int? selected;

  AppBottombar({super.key, this.selected});

  @override
  State<AppBottombar> createState() => _AppBottombarState();
}

class SupportDepartment {
  final String name;
  final String email;
  final String subject;
  final String? whatsAppNumber;

  SupportDepartment({
    required this.name,
    required this.email,
    required this.subject,
    this.whatsAppNumber,
  });
}

bool isLoading = true;
int selected = 1;
bool isImageLoading = true;
Timer? _timer;

class _AppBottombarState extends State<AppBottombar> {
  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      isLoading = true;
      selected = widget.selected == null ? -1 : widget.selected!;
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  List<SupportDepartment> whatsAppDepartments = [];

  final List<SupportDepartment> departments = [
    SupportDepartment(
      name: 'AMZ Advice Centre',
      email: 'support@amzadvicecentre.com',
      subject: 'AMZ\tAdvice\tCentre\tSupport',
      whatsAppNumber: '+44-114-405-5024',
    ),
    SupportDepartment(
      name: 'AMZAgency',
      email: 'support@amzagency.co.uk',
      subject: 'AMZAgency\tSupport',
    ),
    SupportDepartment(
      name: 'Marketing Advice Centre',
      email: 'support@marketingadvicecentre.co.uk',
      subject: 'Marketing\tAdvice\tCentre\tSupport',
      whatsAppNumber: '+44-114-405-5021',
    ),
    SupportDepartment(
      name: 'The Marketing Agency',
      email: 'support@the-marketingagency.co.uk',
      subject: 'The\tMarketing\tAgency\tSupport',
    ),
    SupportDepartment(
      name: 'The Advice Centre: Accounts',
      email: 'accounts@theadvicecentre.ltd',
      subject: 'Accounts\tSupport',
    ),
    SupportDepartment(
      name: 'The Advice Centre: Introducers',
      email: 'support@amzadvicecentre.com',
      subject: 'Introducers\tSupport',
    ),
    SupportDepartment(
      name: 'Just Ask Alex',
      email: 'support@amzadvicecentre.com',
      subject: 'Just\tAsk\tAlex\tSupport',
    ),
    SupportDepartment(
      name: 'AMZBuddy',
      email: 'support@amzbuddy.ai',
      subject: 'AMZBuddy\tSupport',
    ),
    // SupportDepartment(
    //     name: 'Advice Center Support',
    //     whatsAppNumber: '447822018873',
    //     email: 'alex@theadvicecentre.ltd',
    //     subject: 'Advice\tCentre\tSupport'),
  ];

  Future<void> launchSupportEmail(SupportDepartment department) async {
    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: department.email,
        queryParameters: {
          'subject': department.subject,
          'body':
              'Hi\tSupport\tTeam,\n\nI\tneed\tassistance\twith\tthe\tfollowing\tissue:\n\n[Please\tdescribe\tyour\tissue\there]\n\nThank\tyou.',
        },
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        throw 'Could not open email client';
      }
    } catch (e) {
      showCustomErrorSnackbar(
        title: 'Email App Not Found',
        message:
            'It seems no email application is installed on your device. Please install one to proceed.',
      );
    }
  }

  SupportDepartment? selectedDepartment;

  void showDepartmentSelector(BuildContext context) {
    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Row with Title and X Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(null),
                    Text(
                      "Select Support Department",
                      style: TextStyle(
                        color: AppColors.bgColor,
                        fontSize: 18.sp,
                        fontFamily: FontFamily.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.close,
                        color: AppColors.bgColor,
                        size: 22.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                // Department List
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: departments.length,
                    itemBuilder: (context, index) {
                      final department = departments[index];
                      final isSelected = selectedDepartment == department;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDepartment = department;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.5.h, horizontal: 3.w),
                          margin: EdgeInsets.symmetric(vertical: 0.5.h),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.bgColor.withOpacity(0.1)
                                : Colors.transparent,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.bgColor
                                  : Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isSelected
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off,
                                color: AppColors.bgColor,
                                size: 20.sp,
                              ),
                              SizedBox(width: 3.w),
                              Expanded(
                                child: Text(
                                  department.name,
                                  style: TextStyle(
                                    color: AppColors.bgColor,
                                    fontSize: 16.sp,
                                    fontFamily: FontFamily.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 2.h),
                // Continue Button
                GestureDetector(
                  onTap: () {
                    if (selectedDepartment != null) {
                      Get.back();
                      Get.back();
                      launchSupportEmail(selectedDepartment!);
                    } else {
                      showCustomErrorSnackbar(
                        title: 'No Department Selected',
                        message:
                            'Please select a support department to continue.',
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 1.8.h),
                    decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: FontFamily.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
              ],
            ),
          );
        },
      ),
      isScrollControlled: true,
    );
  }

  Future<void> launchSupportWhatsApp(SupportDepartment department) async {
    if (department.whatsAppNumber == null) {
      showCustomErrorSnackbar(
        title: 'WhatsApp Not Available',
        message: 'Please select a support department to continue.',
      );
      return;
    }

    try {
      final String formattedNumber =
          department.whatsAppNumber!.replaceAll(RegExp(r'[^0-9]'), '');
      final Uri whatsappUri = Uri.parse(
        "https://wa.me/$formattedNumber?text=Hi,%20can%20you%20help%20me%20with%20the%20Following%20please:%0A%0A[Please%20describe%20your%20issue%20here]%0A%0AThank%20you.",
      );

      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch WhatsApp';
      }
    } catch (e) {
      showCustomErrorSnackbar(
        title: 'WhatsApp Not Available',
        message: 'WhatsApp is not installed or supported on this device.',
      );
    }
  }

  void showWhatsAppDepartmentSelector(BuildContext context) {
    setState(() {
      whatsAppDepartments =
          departments.where((d) => d.whatsAppNumber != null).toList();
    });

    SupportDepartment? selectedWhatsAppDept;

    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(null),
                    Text(
                      "Select Support Department",
                      style: TextStyle(
                        color: AppColors.bgColor,
                        fontSize: 18.sp,
                        fontFamily: FontFamily.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.close,
                        color: AppColors.bgColor,
                        size: 22.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),

                // WhatsApp department list
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: whatsAppDepartments.length,
                    itemBuilder: (context, index) {
                      final department = whatsAppDepartments[index];
                      final isSelected = selectedWhatsAppDept == department;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedWhatsAppDept = department;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.5.h, horizontal: 3.w),
                          margin: EdgeInsets.symmetric(vertical: 0.5.h),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.bgColor.withOpacity(0.1)
                                : Colors.transparent,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.bgColor
                                  : Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isSelected
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off,
                                color: AppColors.bgColor,
                                size: 20.sp,
                              ),
                              SizedBox(width: 3.w),
                              Expanded(
                                child: Text(
                                  department.name,
                                  style: TextStyle(
                                    color: AppColors.bgColor,
                                    fontSize: 16.sp,
                                    fontFamily: FontFamily.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 2.h),

                // Continue Button
                GestureDetector(
                  onTap: () {
                    if (selectedWhatsAppDept != null) {
                      Get.back();
                      Get.back();
                      launchSupportWhatsApp(selectedWhatsAppDept!);
                    } else {
                      showCustomErrorSnackbar(
                        title: 'No Department Selected',
                        message:
                            'Please select a WhatsApp department to continue.',
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 1.8.h),
                    decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: FontFamily.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
              ],
            ),
          );
        },
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
      ),
      height: Platform.isAndroid ? 13.h : 14.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (selected != 1) {
                setState(() {
                  selected = 1;
                });
                Get.offAll(() => const Homescreen());
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Imgs.first,
                  scale: 30,
                  color:
                      selected == 1 ? AppColors.orangeColor : AppColors.bgColor,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    color: selected == 1
                        ? AppColors.orangeColor
                        : AppColors.bgColor,
                    fontSize: 14.5.sp,
                    fontFamily: FontFamily.bold,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selected != 2) {
                setState(() {
                  selected = 2;
                });
                Get.offAll(() => const manageMembershipScreen());
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Imgs.second,
                  scale: 30,
                  color:
                      selected == 2 ? AppColors.orangeColor : AppColors.bgColor,
                ),
                Text(
                  "Membership",
                  style: TextStyle(
                    color: selected == 2
                        ? AppColors.orangeColor
                        : AppColors.bgColor,
                    fontSize: 14.5.sp,
                    fontFamily: FontFamily.bold,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              openZohoChat();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Imgs.third,
                  scale: 30,
                  color: AppColors.bgColor,
                ),
                Text(
                  "Chat With Us",
                  style: TextStyle(
                    color: AppColors.bgColor,
                    fontSize: 14.5.sp,
                    fontFamily: FontFamily.bold,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (selected != 4) {
                setState(() {
                  selected = 4;
                });
                Get.offAll(const adviceTicketsScreen());
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Imgs.ticketsImage,
                  scale: 30,
                  color:
                      selected == 4 ? AppColors.orangeColor : AppColors.bgColor,
                ),
                Text(
                  "Advice",
                  style: TextStyle(
                    color: selected == 4
                        ? AppColors.orangeColor
                        : AppColors.bgColor,
                    fontSize: 14.5.sp,
                    fontFamily: FontFamily.bold,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              setState(() {
                selectedDepartment = null;
              });
              moreBottomSheet();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Imgs.fifth,
                  scale: 30,
                  color: AppColors.bgColor,
                ),
                Text(
                  "More",
                  style: TextStyle(
                    color: AppColors.bgColor,
                    fontSize: 14.5.sp,
                    fontFamily: FontFamily.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ).paddingOnly(bottom: 1.5.h),
    );
  }

  void openZohoChat() {
    if (Platform.isAndroid) {
      log('Android');
      ZohoSalesIQ.startChat('Hello, I need assistance');
    } else if (Platform.isIOS) {
      log('Ios');
      ZohoSalesIQ.openNewChat();
    }
  }

  void moreBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              expand: false,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    width: Device.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(CupertinoIcons.clear),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GridView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.to(const TheAdviceCentreAcademyScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.academyIcon,
                                    scale: 20,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Training Academy",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.to(const partnersScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.fourth,
                                    scale: 20,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Partners",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.to(const BillsnPaymentsscreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.billsIcon,
                                    scale: 20,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Bills & Payments",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(WebviewScreen(
                                  link:
                                      "https://introducers.theadvicecentre.ltd/home",
                                ));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.rewardsIcon,
                                    scale: 18,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Rewards",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDepartmentSelector(context);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.emailSupport,
                                    scale: 5,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Email Support",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showWhatsAppDepartmentSelector(context);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.wpSupport,
                                    scale: 10,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Whatsapp Support",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.to(const DemandServicesScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.servicesIcon,
                                    scale: 6,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "On-Demand Services",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.to(const moreScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.gearsIcon,
                                    scale: 10,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "More",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.to(const PersonalDetailsScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.myInfoIcon,
                                    scale: 20,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "My Info",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                Get.to(const FormsApprovalScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.formsIcon,
                                    scale: 23,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Forms & Approvals",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CupertinoAlertDialog(
                                      title: Text(
                                        'Confirm Logout',
                                        style: TextStyle(fontSize: 18.sp),
                                      ),
                                      content: Text(
                                        'Are you sure you want to log out?',
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
                                          onPressed: () async {
                                            clearId();
                                            SaveAuthtokenData.clearUserData();
                                            SaveDataLocal.clearUserData();
                                            Get.offAll(const LandingScreen());
                                            String? storedId = await getId();
                                            print(
                                                "Stored ID =====>>> $storedId");
                                          },
                                          child: const Text('Yes'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.logoutIcon,
                                    scale: 5,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Log Out",
                                    style: TextStyle(
                                      color: AppColors.bgColor,
                                      fontSize: 15.sp,
                                      fontFamily: FontFamily.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Example scroll content
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Future clearId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  Future<String?> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('my_id');
  }
}
