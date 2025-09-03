import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/apiCalling/loader.dart';
import 'package:zohosystem/ui/moreScreen/modal/fetchNotificationsModal.dart';

import '../../../apiCalling/apiConfig.dart';
import '../../../utils/bottomBar.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/snackBars.dart';
import '../../homeScreen/provider/homeProvider.dart';

class MyMessagesScreen extends StatefulWidget {
  const MyMessagesScreen({super.key});

  @override
  State<MyMessagesScreen> createState() => _MyMessagesScreenState();
}

class _MyMessagesScreenState extends State<MyMessagesScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNotis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: isLoading
          ? Center(
              child: Loader(),
            )
          : SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          for (int i = 0;
                              i <
                                  (fetchNotifications?.notifications?.length ??
                                      0);
                              i++) ...[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.5.h, horizontal: 3.w),
                              child: Container(
                                width: Device.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.5.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF5F5F5),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AppColors.blackColor
                                        .withValues(alpha: 0.1),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    /// Rounded Icon Container
                                    Container(
                                      padding: EdgeInsets.all(1.2.h),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.bgColor.withValues(
                                            alpha:
                                                0.10), // background color of icon container
                                      ),
                                      child: Icon(
                                        Icons.notifications,
                                        color: AppColors.bgColor,
                                        size: 18.sp,
                                      ),
                                    ),
                                    SizedBox(width: 3.w),

                                    /// Notification Content
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /// Top Row: Author + Date
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Me",
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                              Text(
                                                fetchNotifications
                                                            ?.notifications?[i]
                                                            .createdAt !=
                                                        null
                                                    ? DateFormat(
                                                            "dd MMM yyyy, hh:mm a")
                                                        .format(
                                                        DateTime.parse(fetchNotifications
                                                                    ?.notifications?[
                                                                        i]
                                                                    .createdAt ??
                                                                '')
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
                                            fetchNotifications
                                                    ?.notifications?[i]
                                                    .message ??
                                                "",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                          SizedBox(
                            height: 27.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: AppBottombar(),
      ),
    );
  }

  fetchNotis() async {
    setState(() => isLoading = true);

    final Map<String, dynamic> data = {
      "customer_id": userData?.data?[0].customerId,
    };

    log("Data: ${data.toString()}");

    try {
      final response = await HomeProvider().fetchNotification(data);

      fetchNotifications =
          FetchNotificationsModal.fromJson(json.decode(response.body));

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() => isLoading = false);
        log('hosted url: ${updatePaymentMethod?.hostedpage?.url}');
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
      setState(() => isLoading = false);
    }
  }
}
