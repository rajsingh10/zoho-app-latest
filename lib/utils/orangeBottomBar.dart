import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesiq_mobilisten/salesiq_mobilisten.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/bills&Payments/view/bills&PaymentsScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/joinTodayButtonPage.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/moreOreangeScreen.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/noMembersHomeScreen.dart';
import 'package:zohosystem/utils/fontFamily.dart';

import '../ui/adviceTicketsScreen/view/adviceTicketsScreen.dart';
import '../ui/theAdviceCentreAcademyScreen/view/theAdviceCentreaAademyScreen.dart';
import 'colors.dart';
import 'images.dart';

// ignore: must_be_immutable
class AppOrangeBottombar extends StatefulWidget {
  int? selected;

  AppOrangeBottombar({super.key, this.selected});

  @override
  State<AppOrangeBottombar> createState() => _AppOrangeBottombarState();
}

bool isLoading = true;
int selected = 1;
bool isImageLoading = true;
Timer? _timer;

class _AppOrangeBottombarState extends State<AppOrangeBottombar> {
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
                Get.offAll(() => const Nomembershomescreen());
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
                Get.offAll(() => const joinTodayButtonPage());
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Imgs.nosecond,
                  scale: 30,
                  color:
                      selected == 2 ? AppColors.orangeColor : AppColors.bgColor,
                ),
                Text(
                  "Our Services",
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
            onTap: () async {
              if (selected != 3) {
                setState(() {
                  selected = 3;
                });
                Get.offAll(() => const moreOreangeScreen());
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Imgs.fifth,
                  scale: 30,
                  color:
                      selected == 3 ? AppColors.orangeColor : AppColors.bgColor,
                ),
                Text(
                  "More",
                  style: TextStyle(
                    color: selected == 3
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
                                    "Advice Academy",
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
                                Get.offAll(const adviceTicketsScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.second,
                                    scale: 20,
                                    color: AppColors.bgColor,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Advice Tickets",
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
                                Get.to(const moreOreangeScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Imgs.fifth,
                                    scale: 20,
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
}
