import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/noMembershipScreens/view/webviewScreen.dart';
import 'package:zohosystem/utils/bottomBar.dart';

import '../../../utils/colors.dart';
import '../../../utils/fontFamily.dart';
import '../../../utils/images.dart';
import '../../../utils/orangeBottomBar.dart';

// ignore: must_be_immutable
class termsofServicesScreen extends StatefulWidget {
  String? fromPage;

  termsofServicesScreen({super.key, this.fromPage});

  @override
  State<termsofServicesScreen> createState() => _termsofServicesScreenState();
}

class _termsofServicesScreenState extends State<termsofServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              width: Device.width,
              decoration: BoxDecoration(
                  color: widget.fromPage == 'more'
                      ? AppColors.bgColor
                      : AppColors.orangeColor),
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
                      const Icon(null),
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
                    onTap: () => Get.to(
                      WebviewScreen(
                        link:
                            "https://www.marketingadvicecentre.co.uk/terms-of-service",
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Marketing Advice Centre: Terms of Service',
                        style: TextStyle(
                          fontFamily: FontFamily.regular,
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          fontSize: 17.sp,
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
                  InkWell(
                    onTap: () => Get.to(
                      WebviewScreen(
                        link:
                            "https://www.amzadvicecentre.com/terms-of-service",
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'AMZ Advice Centre: Terms of Service',
                        style: TextStyle(
                          fontFamily: FontFamily.regular,
                          fontWeight: FontWeight.normal,
                          color: AppColors.blackColor,
                          fontSize: 17.sp,
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
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child:
            widget.fromPage == 'more' ? AppBottombar() : AppOrangeBottombar(),
      ),
    );
  }
}
