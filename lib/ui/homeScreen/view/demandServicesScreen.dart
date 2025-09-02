import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zohosystem/ui/homeScreen/view/demandWebViewScreen.dart';
import 'package:zohosystem/utils/colors.dart';
import 'package:zohosystem/utils/images.dart';

import '../../../utils/fontFamily.dart';

class DemandServicesScreen extends StatefulWidget {
  const DemandServicesScreen({super.key});

  @override
  State<DemandServicesScreen> createState() => _DemandServicesScreenState();
}

class _DemandServicesScreenState extends State<DemandServicesScreen> {
  @override
  void initState() {
    super.initState();
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
              top: 6.h,
              child: InkWell(
                onTap: () => Get.back(),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Image.asset(
                    Imgs.leftIcon,
                    scale: 5,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
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
              top: 30.h,
              left: 10.w,
              child: Image.asset(
                Imgs.namedLogo,
                scale: 3.5,
                color: AppColors.whiteColor,
              ),
            ),
            Positioned(
                top: 55.h,
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
              top: 42.h,
              left: 7.w,
              child: SizedBox(
                height: 90.w,
                width: 90.w,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Text(
                    'On-Demand Services',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.bold,
                      fontSize: 23.sp,
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
                  Get.to(DemandWebviewScreen(
                    link:
                        "https://www.amzadvicecentre.com/on-demand-amazon-services",
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 5.w),
                  width: 85.w,
                  height: 6.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xfff1811b),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'On-Demand Amazon Services',
                        style: TextStyle(
                            fontSize: 15.sp,
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
                  DemandWebviewScreen(
                    link:
                        "https://www.marketingadvicecentre.co.uk/on-demand-marketing-services",
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 5.w),
                  width: 85.w,
                  height: 6.h,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xfff004aad),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'On-Demand Marketing Services',
                        style: TextStyle(
                            fontSize: 15.sp,
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
              top: 83.h,
              right: 5.w,
              child: SizedBox(
                width: 60.w,
                child: Text(
                  'Members receive exclusive access to discounted on - demand services',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
