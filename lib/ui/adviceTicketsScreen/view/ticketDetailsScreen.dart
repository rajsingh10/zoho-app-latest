import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/apiConfig.dart';
import 'package:zohosystem/ui/adviceTicketsScreen/modal/ticketRepliesModal.dart';
import 'package:zohosystem/utils/snackBars.dart';

import '../../../apiCalling/Loader.dart';
import '../../../apiCalling/checkInternetModule.dart';
import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../homeScreen/modal/getTimeEntryModal.dart';
import '../../homeScreen/provider/homeProvider.dart';
import '../modal/viewDetailsTikitModal.dart';
import '../provider/adviceProvider.dart';

// ignore: must_be_immutable
class TicketDetailsScreen extends StatefulWidget {
  var tickitid;

  TicketDetailsScreen({super.key, required this.tickitid});

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    allDetailsTicketApi();
  }

  String? storedId;

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
                          Text(
                            "Advice Tickets",
                            style: TextStyle(
                              fontFamily: FontFamily.bold,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                              fontSize: 19.sp,
                            ),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 2.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 1.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xffE9E7E7)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () async {},
                                        child: const Icon(null),
                                      ),
                                      Image.asset(
                                        Imgs.namedLogo,
                                        scale: 4.5,
                                      ),
                                      const Icon(null),
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
                                    height: 1.h,
                                  ),
                                  Container(
                                    width: Device.width,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 4.w),
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Subject
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Subject :- ",
                                                style: TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: viewDetailsTikitModal
                                                        ?.subject ??
                                                    "",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 1.h),

                                        // Description
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Description :- ",
                                                style: TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: viewDetailsTikitModal
                                                        ?.description ??
                                                    "",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 1.h), // Time-Entry
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Total Time Spent :- ",
                                                style: TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: totalTimeString,
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 1.h),

                                        // Due Date
                                        if (viewDetailsTikitModal?.dueDate !=
                                            null)
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "DueDate :- ",
                                                  style: TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: DateFormat(
                                                          "dd MMM yyyy, hh:mm a")
                                                      .format(
                                                    DateTime.parse(
                                                            viewDetailsTikitModal
                                                                    ?.dueDate ??
                                                                '')
                                                        .toLocal(),
                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        SizedBox(height: 1.h),

                                        // Layout
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Layout :- ",
                                                style: TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: viewDetailsTikitModal
                                                        ?.layoutDetails
                                                        ?.layoutName ??
                                                    "",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 1.h),

                                        // Status
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Status Type :- ",
                                                style: TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: viewDetailsTikitModal
                                                        ?.status ??
                                                    "",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16.sp,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ticket Replies :",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: FontFamily.bold),
                                      )
                                    ],
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
                                    child: Column(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                (ticketReplies?.data?.length ??
                                                    0);
                                            i++)
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0.5.h),
                                            child: Container(
                                              width: Device.width,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.5.h),
                                              decoration: BoxDecoration(
                                                color: const Color(0xffF5F5F5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: AppColors.blackColor
                                                        .withValues(
                                                            alpha: 0.1)),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  /// Top Row: Author + Date
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ticketReplies?.data?[i]
                                                                  .author?.id ==
                                                              storedId
                                                          ? Text(
                                                              "Me",
                                                              style: TextStyle(
                                                                fontSize: 15.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColors
                                                                    .blackColor,
                                                              ),
                                                            )
                                                          : Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    ticketReplies
                                                                            ?.data?[i]
                                                                            .author
                                                                            ?.name ??
                                                                        "",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: AppColors
                                                                          .blackColor,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    ticketReplies
                                                                            ?.data?[i]
                                                                            .author
                                                                            ?.email ??
                                                                        "",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: AppColors
                                                                          .blackColor,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Text(
                                                        ticketReplies?.data?[i]
                                                                    .createdTime !=
                                                                null
                                                            ? DateFormat(
                                                                    "dd MMM yyyy, hh:mm a")
                                                                .format(
                                                                DateTime.parse(ticketReplies!
                                                                        .data![
                                                                            i]
                                                                        .createdTime!)
                                                                    .toLocal(),
                                                              )
                                                            : "",
                                                        style: TextStyle(
                                                          fontSize: 13.sp,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 0.5.h),

                                                  /// Reply Content
                                                  Text(
                                                    ticketReplies?.data?[i]
                                                            .summary ??
                                                        "",
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color:
                                                          AppColors.blackColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  bool isLoading = true;
  ViewDetailsTikitModal? viewDetailsTikitModal;

  void allDetailsTicketApi() async {
    storedId = await HomeProvider().getId();

    checkInternet().then((internet) async {
      if (internet) {
        Adviceprovider()
            .viewtikitdetaisl(widget.tickitid)
            .then((response) async {
          viewDetailsTikitModal =
              ViewDetailsTikitModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            setState(() {
              // isLoading = false;
            });
            allTicketRepliesApi();
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, stackTrace) {
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

        showCustomErrorSnackbar(title: 'Error', message: 'Internet Required');
      }
    });
  }

  void allTicketRepliesApi() {
    checkInternet().then((internet) async {
      if (internet) {
        Adviceprovider()
            .viewtikitrepliesdetaisl(widget.tickitid)
            .then((response) async {
          ticketReplies =
              TicketRepliesModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            setState(() {
              ticketTimeEntryApi();
              // isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, stackTrace) {
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
        showCustomErrorSnackbar(title: 'Error', message: 'Internet Required');
      }
    });
  }

  // void ticketTimeEntryApi() {
  //   checkInternet().then((internet) async {
  //     if (internet) {
  //       HomeProvider().getTimeEntryApi(widget.tickitid).then((response) async {
  //         getTimeEntry = GetTimeEntryModal.fromJson(json.decode(response.body));
  //         if (response.statusCode == 200) {
  //           setState(() {
  //             isLoading = false;
  //           });
  //         } else {
  //           setState(() {
  //             isLoading = false;
  //           });
  //         }
  //       }).catchError((error, stackTrace) {
  //         if (mounted) {
  //           setState(() {
  //             isLoading = false;
  //           });
  //           log('Error : ${stackTrace.toString()}');
  //         }
  //       });
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       showCustomErrorSnackbar(title: 'Error', message: 'Internet Required');
  //     }
  //   });
  // }
  String totalTimeString = "00:00:00"; // declare this at class level

  void ticketTimeEntryApi() {
    checkInternet().then((internet) async {
      if (internet) {
        HomeProvider().getTimeEntryApi(widget.tickitid).then((response) async {
          getTimeEntry = GetTimeEntryModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200) {
            // calculate total time here
            totalTimeString = calculateTotalTime(getTimeEntry!);

            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }).catchError((error, stackTrace) {
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
        showCustomErrorSnackbar(title: 'Error', message: 'Internet Required');
      }
    });
  }

  /// function to calculate total time in hh:mm:ss
  String calculateTotalTime(GetTimeEntryModal getTimeEntry) {
    int totalSeconds = 0;

    if (getTimeEntry.data != null) {
      for (var entry in getTimeEntry.data!) {
        int hours = int.tryParse(entry.hoursSpent ?? '0') ?? 0;
        int minutes = int.tryParse(entry.minutesSpent ?? '0') ?? 0;
        int seconds = int.tryParse(entry.secondsSpent ?? '0') ?? 0;

        totalSeconds += (hours * 3600) + (minutes * 60) + seconds;
      }
    }

    // convert total seconds into hh:mm:ss format
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  }
}
